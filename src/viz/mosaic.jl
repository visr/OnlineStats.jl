"""
    Mosaic(T::Type, S::Type)

Data structure for generating a mosaic plot, a comparison between two categorical variables.

# Example

    using OnlineStats, Plots 
    x = [rand() > .8 for i in 1:10^5]
    y = rand([1,2,2,3,3,3], 10^5)
    s = series([x y], Mosaic(Bool, Int))
    plot(s)
"""
mutable struct Mosaic{T, C<:CountMap} <: OnlineStat{VectorOb}
    value::OrderedDict{T, C}
    n::Int
end
Mosaic(T::Type, S::Type) = Mosaic(OrderedDict{T, CountMap{S, OrderedDict{S,T}}}(), 0)
Base.show(io::IO, o::Mosaic{T,S}) where {T, S} = print(io, "Mosaic: $T × $S")
function _fit!(o::Mosaic{T, C}, xy) where {T, S, C<:CountMap{S, OrderedDict{S,T}}}
    o.n += 1
    if haskey(o.value, first(xy))
        _fit!(o.value[first(xy)], last(xy))
    else 
        stat = CountMap(S)
        _fit!(stat, last(xy))
        o.value[first(xy)] = stat
    end
end
Base.keys(o::Mosaic) = sort!(collect(keys(o.value)))
subkeys(o::Mosaic) = sort!(mapreduce(x->collect(keys(x)), union, values(o.value)))


@recipe function f(o::Mosaic{T,S}) where {T,S}
    kys = sort!(collect(keys(o.value)))
    n = nobs(o)
    xwidths = [nobs(o.value[ky]) / n for ky in kys]
    xedges = vcat(0.0, cumsum(xwidths))

    subkys = subkeys(o)
    y = zeros(length(subkys), length(kys))
    for (j, ky) in enumerate(kys) 
        y[:, j] = probs(o.value[ky], subkys)
        y[:, j] = 1.0 - vcat(0.0, cumsum(y[1:(end-1), j]))
    end

    seriestype := :bar
    bar_widths := xwidths
    labels := subkys
    xticks := (midpoints(xedges), kys)
    xlim := (0, 1)
    ylim := (0, 1)

    xedges, y'
end