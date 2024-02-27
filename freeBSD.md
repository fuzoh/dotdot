# FreeBSD

> Some tips and tricks for configuring and working with freebsd.

## Screen backlight

```sh
backlight incr 20 # increase luminosity by 20%
backlignt decr 20 # decrease luminosity by 20%
```

## Battery percentage

```sh
apm -l
```


## Scaling chrome on hidpi screen with wayland

Go to `chrome://flags`, then search `ozone`, set the parameter to wayland.

