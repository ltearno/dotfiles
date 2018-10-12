# Dell XPS 13

## Bluetooth mouse in Simple Pairing Mode

The mouse operates in advanced bluetooth mode for Ubuntu, check this page : https://ericasberry.com/blog/2016/09/30/pairing-a-logitech-mx-master-mouse-with-ubuntu-16-04-using-bluetooth/

Once you have gone through the regular pairing procedure, enter the following commands (as root):

```bash
hciconfig hci0 sspmode 1
hciconfig hci0 down
hciconfig hci0 up
```

