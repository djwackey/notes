# Python-Mode #
###### Version: 0.8.1 ######
## 目录 ##
1. [简介](#intro)
2. [一般功能](#common)

	2.1 [Python版本](#python_version)</br>
	2.2 [Python缩进](#python_indent)</br>
	2.3 [Python折行](#python_folding)</br>
	2.4 [Vim跳转](#python_motion)</br>
	2.5 [显示文档](#show_document)</br>
	2.6 [支持virtualenv](#virtualenv)</br>
	2.7 [运行代码](#run_code)</br>
	2.8 [断点](#breakpoints)</br>
3. [代码检测](#checking)

	3.1 [代码检测选项](#checker_options)</br>
4. [Rope支持](#rope)

	4.1 [代码补全](#completion)</br>
	4.2 [跳转定义处](#definition)</br>
	4.3 [重构](#refactoring)</br>
	4.4 [撤销与重做](#undo_or_redo)</br>
5. [语法](#syntax)
6. [FAQ](#faq)
7. [版权信息](#credits)
8. [许可证](#license)

<h2 id="intro"> 1.简介 </h2>
Python-mode是一个vim插件，通过使用pylint, rope和pydoc库，提供给你一些特性，如：python代码检测，重构和其他一些有用的事情。

这个插件可以让你在vim中轻松创建python代码。而且你也不需要在你的操作系统中安装pylint或者rope库。

Python-mode包含了vim中所有你需要开发python应用程序的工具。

**特性**：

- 支持 Python 版本 2.6+ 和 3.2+
- 语法高亮
- 支持 Virtualenv
- 运行python代码（`<leader>r`）
- 添加/删除断点（`<leader>b`）
- 改进Python缩进
- Python折行
- Python跳转和操作（`]]`, `3[[`, `]]M`, `vaC`, `viM`, `daC`, `ciM`, ...）
- 代码检测（pylint_, pyflakes_, pylama_, ...），能够同时运行（`:PymodeLint`）
- 自动修复PEP8错误（`:PymodeLintAuto`）
- 在python文档中搜索（`K`）
- 代码重构<rope重构库>（rope_）
- 跳转定义处（`<C-c>g` for :RopeGotoDefinition）
- 还有 更多，更多 ...

<h2 id="common"> 2.一般功能 </h2>
这个脚本提供以下选项，可以自定义PythonMode的行为。这些选项应该在你的vimrc中设置。

以下显示了默认值。

**开启插件功能**

	let g:pymode = 1

**关闭插件警告**
	
	let g:pymode_warnings = 1

**添加路径到 sys.path，值为路径字符串的列表**

	let g:pymode_paths = []

**当保存文件时，去除没有使用的空格**

	let g:pymode_trim_whitespaces = 1

**设置默认的python选项**

	let g:pymode_options = 1

如果这个选项被设置为1，pymode将针对python缓存（buffers），开启以下选项：

	setlocal complete+=t
	setlocal formatoptions-=t
	if v:version > 702 && !&relativenumber
		setlocal number
	endif
	setlocal nowrap
	setlocal textwidth=79
	setlocal commentstring=#%s
	setlocal define=^\s*\\(def\\\\|class\\)

**设置最大行长度**

	let g:pymode_options_max_line_length = 79

**开启最大行处显示颜色列**

	let g:pymode_options_colorcolumn = 1

**设置pymode快速修复窗口**

	let g:pymode_quickfix_minheight = 3
	let g:pymode_quickfix_maxheight = 6

<h3 id="python_version"> 2.1 Python版本 </h3>

默认情况下，pymode查找Vim中支持的当前python版本。你能够选择一个想要的版本，但是当加载时将会检测是否正确。

    let g:pymode_python = 'python'

值是 python, python3, disable，如果值设置为disable，**pymode**的大部分python特性将会失效。

如果你是python3项目。设置值为python3。你能够使用exrc

<h3 id="python_indent"> 2.2 Python缩进 </h3>

Pymode支持PEP8兼容模式缩进。

**开启pymode缩进**
 
    let g:pymode_indent = 1

<h3 id="python_folding"> 2.3 Python折行 </h3>

快速的和通常的python折行。

**开启pymode折行**

    let g:pymode_folding = 1

<h3 id="python_motion"> 2.4 Vim跳转 </h3>

支持python对象（如：函数，类，方法）的Vim跳转（请看 `具体操作`）

C — 类
M — 方法或函数


| 键 | 命令 |
| :---: | :---: |
| [[ | 跳转到之前的类或函数（正常、可视、操作者模式） |
| ]] | 跳转到之后的类或函数（正常、可视、操作者模式） |
| [M | 跳转到之前的类或方法（正常、可视、操作者模式） |
| ]M | 跳转到之后的类或方法（正常、可视、操作者模式） |
| aC | 选择一个类。例如：vaC, daC, yaC, caC（正常、操作者模式） |
| iC | 选择内部类。例如：viC, diC, yiC, ciC（正常、操作者模式） |
| aM | 选择一个函数或方法。例如：vaM, daM, yaM, caM（正常、操作者模式） |
| iM | 选择内部函数或方法。例如：viM, diM, yiM, ciM（正常、操作者模式） |

**开启pymode跳转**

    let g:pymode_motion = 1

<h3 id="show_document"> 2.5 显示文档 </h3>

Pymode可以通过pydoc为当前单词显示文档信息。

**命令**：

	:PymodeDoc <args> - 显示文档

**打开文档脚本**

    let g:pymode_doc = 1

**为所选单词显示文档，绑定键**

    let g:pymode_doc_bind = 'K'

<h3 id="virtualenv"> 2.6 支持virtualenv </h3>

**命令**：

	:PymodeVirtualenv <path> - 激活虚拟环境（路径关联工作目录）

**开启自动virtualenv检测**

    let g:pymode_virtualenv = 1

**手动设置virtualenv路径**

    let g:pymode_virtualenv_path = $VIRTUAL_ENV

<h3 id="run_code"> 2.7 运行代码 </h3>

**命令**：

	:PymodeRun —— 运行当前缓存（buffer）或者选择的代码块	

**开启代码脚本运行**

    let g:pymode_run = 1

**为运行代码，绑定键**

    let g:pymode_run_bind = '<leader>r'

<h3 id="breakpoints"> 2.8 断点 </h3>

Pymode自动检测可用的调试器（如：pdb, ipdb, pudb），用户可以一键设置/取消断点，而不用代码检测等。

**开启功能**

    let g:pymode_breakpoint = 1

**绑定键**

    let g:pymode_breakpoint_bind = '<leader>b'

**手动设置断点命令（如果是空，则自动检测）**

    let g:pymode_breakpoint_cmd = ''

<h2 id="checking"> 3.代码检测 </h2>

Pymode支持pylint, pep257, pep8, pyflakes, mccabe代码检测。你可以运行很多相似的检测工具。

    Pymode使用Pylama库进行代码检测。许多选项像略过文件，错误等，可以在pylama.ini或者模式行中设置。
    获取更多细节信息，查看Pylama文档。
    Pylint选项（如：禁用消息）可能被定义在$HOME/pylint.rc中
    请看pylint文档。

**命令**：

	:PymodeLint -- 在当前缓存（buffer）中检测代码
	:PymodeLintToggle -- 切换代码检测
	:PymodeLintAuto -- 自动修复当前缓存（buffer）的PEP8错误

**开启代码检测**

    let g:pymode_lint = 1

**每次保存时，进行代码检测（如果文件已经被修改）**

    let g:pymode_lint_on_write = 1

**每次保存时，进行代码检测（每次）**

    let g:pymode_lint_unmodified = 0

**编辑时，进行代码检测（动态触发）**

    let g:pymode_lint_on_fly = 0

**当光标放在错误行，显示错误消息**

    let g:pymode_lint_message = 1

**默认代码检测（可以设置多个）**

    let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

可能的值为：pylint, pep8, mccabe, pep257, pyflakes

**忽略错误和警告**
例如："E501,W002", "E2,W"（使用E2开头，忽略所有的警告和错误）

    let g:pymode_lint_ignore = "E501,W"

**选择一些错误和警告**
例如：你可以使用 'W'开头，禁用所有的警告，除非你想看到 'W0011' 和 'W430'警告

    let g:pymode_lint_select = "E501,W0011,W430"

**相关排序**
如果不是空的，错误将会通过相关性排序。例如：`let g:pymode_lint_sort = ['E', 'C', 'I']` 错误首先会是 'E'，然后是 'C'，最后 ...

    let g:pymode_lint_sort = []

**如果发现任何的错误，自动打开cwindow（快速修复）**

    let g:pymode_lint_cwindow = 1

**放置错误标记**

    let g:pymode_lint_signs = 1

**定义以下标记**

    let g:pymode_lint_todo_symbol = 'WW'
    let g:pymode_lint_comment_symbol = 'CC'
    let g:pymode_lint_visual_symbol = 'RR'
    let g:pymode_lint_error_symbol = 'EE'
    let g:pymode_lint_info_symbol = 'II'
    let g:pymode_lint_pyflakes_symbol = 'FF'

<h3 id="checker_options"> 3.1 代码检测选项 </h3>

Pymode有能力通过pymode变量设置代码检测选项：

设置PEP8选项

    let g:pymode_lint_options_pep8 =
        \ {'max_line_length': g:pymode_options_max_line_length})

获取更多信息，请看：https://pep8.readthedocs.org/en/1.4.6/intro.html#configuration

设置Pyflakes选项

    let g:pymode_lint_options_pyflakes = { 'builtins': '_' }

设置mccabe选项

    let g:pymode_lint_options_mccabe = { 'complexity': 12 }

设置pep257选项

    let g:pymode_lint_options_pep257 = {}

设置pylint选项

    let g:pymode_lint_options_pylint =
        \ {'max-line-length': g:pymode_options_max_line_length})

获取更多信息，请看 http://docs.pylint.org/features.html#options

<h2 id="rope"> 4.Rope支持 </h2>

Pymode支持Rope重构操作，代码自动补全和智能提示

**命令**：

	:PymodeRopeAutoImport -- 解决光标下的元素导入
	:PymodeRopeModuleToPackage -- 转移当前的模块到包
	:PymodeRopeNewProject -- 在当前工作目录，打开新的Rope项目
	:PymodeRopeRedo -- 重做上次重构的改变
	:PymodeRopeRegenerate -- 重新生成项目缓存
	:PymodeRopeRenameModule -- 重命名当前模块
	:PymodeRopeUndo -- 撤销上次重构的改变

**开启rope脚本**

    let g:pymode_rope = 1

**.ropeproject目录**

	:PymodeRopeNewProject [<path>] -- 已提供的路径，打开新的Rope项目
	:PymodeRopeRegenerate -- 重新生成项目缓存

Rope使用一个项目内的目录，保存项目的配置和数据。

它的默认名字是.ropeproject。推荐你不要把.ropeproject目录添加到版本控制系统。

当前它被用于以下的事情：

* 在目录中的config.py文件，包含了项目的配置。看一下默认的config.py文件（不存在时就会创建），以获取更多的信息。
* 它会被用于保存项目的历史。以便下次你能够打开之前撤销改变的项目。
* 它会被用于保存对象推论的一些信息。
* 它会被用于保存一个全局的名称缓存，这个缓存将被用于自动导入。

默认情况下，如果在当前目录中，没有找到.ropeproject，rope将会递归的查找父级目录。

警告：如果rope在父级目录中，找到.ropeproject，它将会使用它的所有子目录，可能会导致扫描变慢。（因为存在许多可能不相关的文件）

**开启在父级目录中搜索.ropeproject**

    let g:pymode_rope_lookup_project = 0

你可能也会手动的设置rope项目目录。如果没有指定，rope将会使用当前目录。

    let g:pymode_rope_project_root = ""

如果你希望.ropeproject在你的项目根目录之外，它的目录位置也可能会被覆盖。rope库认为这个目录是项目的资源。所以这个路径总会跟你的项目根目录相关（以'/'开头的路径将会被忽略）。你可以使用 '..' 相对路径，把目录存放在你的项目根目录之外。

    let g:pymode_rope_ropefolder='.ropeproject'

**显示光标下元素的文档**

显示光标下元素的文档

值为空，则禁用键的绑定

    let g:pymode_rope_show_doc_bind = '<C-c>d'

当每次保存时，重新生成项目缓存（如果文件已被修改）

    let g:pymode_rope_regenerate_on_write = 1

<h3 id="completion"> 4.1 自动补全 </h3>

默认情况下，你可以使用<Ctrl-Space>实现自动补全。第一项将会被自动选择，并且你按<Return> 在你的代码中，插入项目。<C-X><C-O>和<C-P>/<C-N>也能做这个。

默认在编辑模式，当键入字符时，自动补全功能会被调用。

**启用代码自动补全功能**

    let g:pymode_rope_completion = 1

**当键入字符，启用自动补全功能**

    let g:pymode_rope_complete_on_dot = 1

**自动补全·键映射**

    let g:pymode_rope_completion_bind = '<C-Space>'

**扩展项目的自动补全（rope能够补全尚未被导入的对象）**

    let g:pymode_rope_autoimport = 0

**默认加载模块时，自动导入**

    let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime'])

**自动补全后，提供未解决的导入对象**

    let g:pymode_rope_autoimport_import_after_complete = 0

<h3 id="definition"> 4.2 跳转定义处 </h3>

默认情况下，当你在代码中的任何对象上面，按<C-C>g时候，你将会跳转到该对象的定义处。

值为空，则禁用键的绑定

    let g:pymode_rope_goto_definition_bind = '<C-c>g'

当定义被找到的时候，打开一个窗口

值为（e, new, vnew）

    let g:pymode_rope_goto_definition_cmd = 'new'

<h3 id="refactoring"> 4.3 重构 </h3>

**重命名项目中的方法/函数/类/变量**

Pymode可以重命名每件事情：类，函数，模块，包，方法，变量和关键参数。

为重命名方法/函数/类/变量，键映射

    let g:pymode_rope_rename_bind = '<C-c>rr'

**重命名当前的模块/包**

    :PymodeRopeRenameModule -- 重命名当前模块

重命名当前的模块，键映射

    let g:pymode_rope_rename_module_bind = '<C-c>r1r'

**导入**

    :PymodeRopeAutoImport -- 解决光标下的元素导入

自动排序导入，根据PEP8，没有使用的导入将会被丢弃。

**键映射**

    let g:pymode_rope_organize_imports_bind = '<C-c>ro'

插入光标下的单词的导入，前提开启'g:pymode_rope_autoimport'

    let g:pymode_rope_autoimport_bind = '<C-c>ra'

**转换模块到包**

    :PymodeRopeModuleToPackage -- 转换模块到包

键绑定：

    let g:pymode_rope_module_to_package_bind = '<C-c>r1p'

**提取方法/变量**

从选中行中，提取方法/变量

    let g:pymode_rope_extract_method_bind = '<C-c>rm'
    let g:pymode_rope_extract_variable_bind = '<C-c>rl'

**使用函数**

尽量找到一个函数能被使用和改变代码代替调用的地方。

    let g:pymode_rope_use_function_bind = '<C-c>ru'

**移动方法/域**

当你想要移动一个类的方法的时候，在这个重构过程中，一个类的方法被移到类的属性之一。旧的方法将会调用新的方法。如果你想要改变所有旧方法的事件，去使用你能够向后内联新的方法。

    let g:pymode_rope_move_bind = '<C-c>rv'

**改变函数签名**

    let g:pymode_rope_change_signature_bind = '<C-c>rs'

<h3 id="undo_or_redo"> 4.4 撤销/重做 </h3>
**命令**

    :PymodeRopeUndo -- 撤销上次改变
    :PymodeRopeRedo -- 重做上次改变


<h2 id="syntax"> 5.语法 </h2>
**开启pymode语法高亮**

	let g:pymode_syntax = 1

**变慢语法同步，以便更好的处理文档代码块。考虑在低配置硬件上，禁用此功能。**

	let g:pymode_syntax_slow_sync = 1

**开启所有python高亮**

	let g:pymode_syntax_all = 1

**高亮 “print” 作为一个函数**

	let g:pymode_syntax_print_as_function = 0

**高亮 "async/await" 关键字**

	let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all

**高亮 “=” 操作符**

    let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all

**高亮 “\*” 操作符**

    let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all

**高亮 'self' 关键字**

    let g:pymode_syntax_highlight_self = g:pymode_syntax_all

**高亮缩进错误**

    let g:pymode_syntax_indent_errors = g:pymode_syntax_all

**高亮空格错误**

    let g:pymode_syntax_space_errors = g:pymode_syntax_all

**高亮字符串格式化**

    let g:pymode_syntax_string_formatting = g:pymode_syntax_all
    let g:pymode_syntax_string_format = g:pymode_syntax_all
    let g:pymode_syntax_string_templates = g:pymode_syntax_all
    let g:pymode_syntax_doctests = g:pymode_syntax_all

**高亮内建对象（True, False, ...）**

    let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

**高亮内建类型（str, list, ...）**

    let g:pymode_syntax_builtin_types = g:pymode_syntax_all

**高亮异常**

    let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

**高亮docstrings作为pythonDocstring（否则作为pythonString）**

    let g:pymode_syntax_docstrings = g:pymode_syntax_all

<h2 id="faq"> 6.FAQ </h2>
**Python-mode不能正常工作**

打开任意python文件，运行“:call pymode#troubleshooting#test()”，修正显示的警告或者将输出发送给我。

**Rope代码自动完成非常慢**

Rope创建了一个项目级别的辅助目录：.ropeproject

如果`.ropeproject`没有出现在当前的目录中，rope将会向上搜索每一个父级目录，去查找`.ropeproject`目录。如果rope在父级目录中找到了`.ropeproject`，它就会设置这个项目为当前目录的所有子目录，所有扫描可能会很慢，因为有很多的目录和文件。

解决方案：

- 从父级目录中，删除 .ropeproject，并且在当前的目录中，创建.ropeproject。
- 运行`:PymodeRopeNewProject`，在当前的目录中,创建.ropeproject。
- 设置'g:pymode_rope_lookup_project'为 0，防止在父级目录进行搜索。

你也可以设置'g:pymode_rope_project_root'，指定项目的根目录。

**Pylint代码检测非常慢**

在一些项目中，pylint可能会检测非常慢，因为它会尽可能的扫描导入的模块。尝试使用另外的代码检测工具：请看 'g:pymode_lint_checkers'。

你可能在你的vimrc中设置了exrc和secure，想要自动设置自定义的配置，在你的项目目录中的.vimrc文件。

**OSX不能导入urandom**

请看：https://groups.google.com/forum/?fromgroups=#!topic/vim_dev/2NXKF6kDONo

顺序执行以下命令，修正这个问题：

	brew unlink python
	brew unlink macvim
	brew remove macvim
	brew install -v --force macvim
	brew link macvim
	brew link python

<h2 id="credits"> 7.版权信息 </h2>

	Kirill Klenov
		http://klen.github.com/
		http://github.com/klen/

	Rope
		Copyright (C) 2006-2010 Ali Gholami Rudi
		Copyright (C) 2009-2011 Anton Gritsay

	Pylint
		Copyright (C) 2003-2011 LOGILAB S.A. (Paris, FRANCE).
		http://www.logilab.fr/

	Pyflakes:
		Copyright (c) 2005 Divmod, Inc.
		http://www.divmod.com/

	PEP8:
		Copyright (c) 2006 Johann C. Rocholl <johann@rocholl.net>
		http://github.com/jcrocholl/pep8

    autopep8:
        Copyright (c) 2012 hhatto <hhatto.jp@gmail.com>
        https://github.com/hhatto/autopep8

    Python syntax for vim:
        Copyright (c) 2010 Dmitry Vasiliev
        http://www.hlabs.spb.ru/vim/python.vim

    PEP8 VIM indentation
        Copyright (c) 2012 Hynek Schlawack <hs@ox.cx>
        http://github.com/hynek/vim-python-pep8-indent

<h2 id="license"> 8.许可证 </h2>
Python-mode发布于GNU lesser general public许可证

请看：http://www.gnu.org/copyleft/lesser.html

如果你喜欢这个插件，你给我发明信片的话，我会非常感激的。:)

我的地址是："Russia, 143500, MO, Istra, pos. Severny 8-3" to "Kirill Klenov"。

非常感谢你的支持。
