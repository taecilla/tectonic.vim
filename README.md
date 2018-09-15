Small plug-in that will try to keep synced your buffers with your
file system. It exposes three commands:

- `:Delete[!] [{bufname}]` will delete the buffer and the file on
  disk.
- `:Move {filename}` will change the buffer name and the file name
  relative to `:pwd`.
- `:Rename {filename}` will do the same but relative to the buffer
  directory.

Also when you edit a file in a directory that doesn't exists it
will ask you if you really want to create that directory.
