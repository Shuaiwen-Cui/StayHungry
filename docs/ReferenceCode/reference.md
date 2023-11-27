This file is for reference uses.

# Common Emojis
🏆 🏗️ 📌 🔬 🧰 ⚙ 🚀 📉 🎙️ 📸 🧠 🤖 🥷🏻 🌐 ✒️ 🏘️ 🦾 🔗 🖋️ 📚️ ☁️  🕹️ 💻 🎮️

# Docsify Plugins & Configurations

## PDF Embedding
put the following code in the `index.html` file of the docsify project
the first line is the plugin
the second / third line is the format of the pdf file

```
<!-- PDFObject.js is a required dependency of this plugin -->
<script src="//cdnjs.cloudflare.com/ajax/libs/pdfobject/2.1.1/pdfobject.min.js"></script>

<!-- This is the source code of the pdf embed plugin -->
<script src="path-to-file/docsify-pdf-embed.js"></script>

<!-- or use this if you are not hosting the file yourself -->
<script src="//unpkg.com/docsify-pdf-embed-plugin/src/docsify-pdf-embed.js"></script>
```

in the position to use the pdf, insert
    
```
```pdf
    <path to the pdf file>
```
```
example:
    
```
```pdf
    /docs/DEVENV/OS/Windows/CMD_Cheat_Sheet.pdf
```
```

or 
```
```pdf
    https://www.cs.columbia.edu/~sedwards/classes/2015/1102-fall/Command%20Prompt%20Cheatsheet.pdf
```
```