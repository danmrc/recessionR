# recessionR
An R package that allows you to plot NBER recessions gray boxes

For example, lets plot the quartely industrial production of USA (you can get ir from [FRED](https://fred.stlouisfed.org/series/IPGMFNQ)) and the command `plot_recession` allows you to see when there is a recession using the classic gray shade areas. For example, if you save the Industrial Production series as `ind_prod`, the following code:

```
plot(ind_prod)
plot_recession("q")

```

Generates the following figure:

![](example.png)

