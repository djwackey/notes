设置显示行号
<pre>
set nu
</pre>

设置TAB为4个空格
<pre>
set ts=4
set expandtab
</pre>

nerdtree关闭主窗口时，自动退出vim
```
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
```

打开文件自动跳到上次位置
<pre>
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
