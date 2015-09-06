# Sublime Plugins

## Package Cntrol

使用`ctrl + ~`调出控制台, 输入下面的代码安装package control

    import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
    
## Config

OSX

```
{
    "caret_style": "phase",
    "color_scheme": "Packages/Color Scheme - Default/Monokai Bright.tmTheme",
    "draw_centered": false,
    "font_face": "Monaco",
    "font_size": 14,
    "gutter": true,
    "highlight_line": true,
    "ignored_packages":
    [
        "SFTP",
        "Vintage",
        "Jedi",
        "Markdown",
        "SublimeClang"
    ],
    "line_numbers": true,
    "line_padding_bottom": 1,
    "line_padding_top": 1,
    "save_on_focus_lost": true,
    "tab_size": 4,
    "theme": "Spacegray Eighties.sublime-theme",
    "translate_tabs_to_spaces": true,
    "update_check": false,
    "word_wrap": true
}
```

## Theme

### [theme - soda](https://packagecontrol.io/packages/Theme%20-%20Soda)

### [theme - spacegray](https://packagecontrol.io/packages/Theme%20-%20Spacegray)

## Plugins

### [Alignment](https://packagecontrol.io/packages/Alignment)

等号对齐, 需要配置快捷键

快捷键 - OSX

    { "keys": ["super+alt+a"], "command": "alignment" }

---

### [Trailing Spaces](https://packagecontrol.io/packages/TrailingSpaces)

清除多余空格, 需要配置快捷键

快捷键 - OSX

	{ "keys": ["super+alt+d"], "command": "delete_trailing_spaces" },

	{ "keys": ["super+alt+o"], "command": "toggle_trailing_spaces" },


---

### [AutoBackups](https://packagecontrol.io/packages/AutoBackups)

文件修改自动备份, `ctrl+alt+b`

修改配置, 禁止打开文件时进行备份, 和备份删除时间

	{
   		"backup_on_open_file": false,
   		"delete_old_backups": 7, // days to delete
	}


---


| name | info |
| ---  | ---  |
| [SideBarEnhancements](https://packagecontrol.io/packages/SideBarEnhancements) | 侧边栏增强工具 |
| [JsFormat](https://packagecontrol.io/packages/JsFormat) | js代码格式化 |
| [CSScomb](https://packagecontrol.io/packages/CSScomb) | css属性排序 |
| [Convert​To​UTF8](https://packagecontrol.io/packages/ConvertToUTF8) | 文档转化成utf8 |
| [DocBlockr](https://packagecontrol.io/packages/DocBlockr) | 输入/** 然后按下tab或者enter快速生成注释 |
| [BracketHighlighter](https://packagecontrol.io/packages/BracketHighlighter) | 括号高亮, 需要修改配置, 默认的匹配样式是下划线, 需要在配置中找到`bracket_styles`, 在下面找到对应的`style` 改成 `highlight` |
| [SublimeCodeIntel](https://packagecontrol.io/packages/SublimeCodeIntel) | 代码跳转 + 代码自动补全, 有的时候不是很好使 |