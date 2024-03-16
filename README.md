# pd-sdk-bug-16443

https://devforum.play.date/t/ascii-control-codes-dropped-from-msg-commands/16443

```
./build.sh
```

Note the different behavior on simulator vs device when pasting this string into the Simulator console. Simulator will print 4 at the top, and show "s??e". Device will print 2 at the top and show "se".

```
!msg se
```

## ASCII characters

```js
asciiChars = Array.from({ length: 128 }, (e, i) => String.fromCharCode(i)).join('')
console.log(asciiChars)
```

The JavaScript snippet above gives the following string, which I've been using for testing minus the  , CR and LF characters.

```
 

 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
```
