using PyCall, PyPlot

fig, ax = subplots(1, 1, figsize=(3,2))
ax.scatter([-1, 1.5], [0,0], s=20, c="k")
Xs = [-3.0]
Ys = [0.0]
r=0.2
for q in pi:0.01*pi:2*pi
    push!(Xs, r*cos(q)-1)
    push!(Ys, r*sin(q))
end
for q in pi:-0.01*pi:0
    push!(Xs, r*cos(q)+1.5)
    push!(Ys, r*sin(q))
end
push!(Xs, 3)
push!(Ys, 0)
plot(Xs, Ys, lw=1, c="r")
ax.annotate("", xy=(0.2, 0), xytext=(-0.5, 0),
arrowprops=Dict("arrowstyle"=>"->", "color"=>"red", "lw"=>1))
xlim(-3, 3)
ylim(-2, 2)
tight_layout()
fig.savefig("contour.png", dpi=400)