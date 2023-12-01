# A Tamarin Container - WIP

## tl;dr
This is supposed to be ready-to-go environment for using the [tamarin-cable](https://github.com/stacksmashing/tamarin-firmware).

## What can I do with it?
You can use ipwndfu to demote checkm8 vulnerable iPhones. All the nessessary steps are taken to flash the tamarin firmware on the pico.

## How do I run it?
We pull the contianer:
```
podman pull ghcr.io/cinber/tamarin-container:latest
```
And run it with:
```
podman run -it -p 4444:4444 ghcr.io/cinber/tamarin-container
```

## Whats in it? (tools and firmware)
- stacksmashing OpenOCD [fork](https://github.com/axi0mX/ipwndfu)
- [tamarin-firmware](https://github.com/stacksmashing/tamarin-firmware)
- [pico-sdk](https://github.com/raspberrypi/pico-sdk.git)
- [ipwndfu](https://github.com/axi0mX/ipwndfu)
- [bonobo configs](https://github.com/lambdaconcept/bonobo-configs.git)

## ToDos:
- proper testing
