# Zellmach

## Zellmach (zm) is going to be
- headless for use in other projects
- extensible via lua or some other config/markup language
- able to import and export popular level formats

### headless
- zm needs to communicate all the data in an easily parsible format, probably json
- zm needs to recieve data, probably in json
- zm needs to operate on that data
`update()` should be a pure function?
this seems like a really good use case for functional programming
> [!DANGER]
> sidetrack...

### extensible
- zm needs to read from a config/ directory, and will probably use lua
```
zellmach/
+config/
| +cells.lua
+zellmach.exe
```
