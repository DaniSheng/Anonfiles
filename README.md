# Anonfiles
Uploader for https://anonymousfiles.io created by Jaxparrow.<br><br>For Begineers and Professionals. Easy to use.
<br>
After Installing You don't need to use the .sh file. Simply type `Anonfiles` to use it anywhere. No need of `.sh`. Bye bye!

# Usage ( Manual Mode )
For Quick Usage - No Extra Options
`$ ./Anonfiles.sh {filepath}`
<br>To Quickly upload file and return link. File will be 

`$ ./Anonfiles.sh {filepath} --expires <time> --index`
<br>The *filepath* is the file which is going to be uploaded. It can be a file name in the currect directory or an absoulute path. But, It must be a file without whitespaces.<br><br>

The option named **--expires** the makes the file delted after the selected time.<br>
*Available Time options*<br>
```
h - for hours
d - for days
w - for weeks
m - for months
```
You can specify 2 weeks by `--expires 2w`

*Indexing*
<br>If you index it. The file you upload will be allowed to be indexed in Search Engines.<br><br>

*More Info*
<br>
use `$ ./Anonfiles.sh --help` to get more information on how to use and what it is.<br><br>

# Guided Mode
![Guided Mode](/images/gmode.png)
<br>In Guided mode, You will be Guided step by step when uploading the file. Very Begineer Friendly design.
Use without any options `e.g Anonfiles.sh` to use **Guided Mode**.<br><br>Also files with *whitespaces* in name can be only uploaded using **Guided Mode**

# Installing
The reason of installing instead of using the standalone is, You can use it anywhere. e.g If you are on the `Desktop` directory. The executable will start on the same directory. Even the *Guided Mode* will become a lot easier. You will need to put absolute path on the standalone executable.<br>
```
$ chmod +x install.sh
$ ./install.sh
```
<br>
After Installing You don't need to use the .sh file. Simply type `Anonfiles` to use it anywhere.

<br>To Install and Enjoy
