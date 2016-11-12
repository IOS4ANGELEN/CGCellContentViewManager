# CGCellContentViewManager

## Doc

English Doc **·** [中文文档](https://github.com/CoderGin/CGCellContentViewManager/blob/master/README-Chinese.md)

---

## Overview

![Overview.gif](https://raw.githubusercontent.com/CoderGin/CGCellContentViewManager/master/Overview.gif)

### Introduction

An elegant way to solve the problem while clicking a UITableViewCell, the subviews in the cell's contentView will change backgroundColor as our unexpected.

**Common Solution**

Disable the native cell's selection style:

```

cell.selectionStyle = UITableViewCellSelectionStyleNone;

```

And then add a button to fill with the cell's contentView to imitate the native selection style.

But it seems to be a little complex.

**Try CGCellContentViewManager!**
**It can make you away from these unnecessary troubles**

## Usage

Just add 2 files into your project, and no need for any setups. All the subviews in the cell's contentView will never change backgroundColor when the cell is clicking.

To disable the CGCellContentViewManager's auto-work for a cell:

```

cell.cg_cellContentViewManagerDisabled = YES;

```

To disable the CGCellContentViewManager's auto-work for a subview in cell's contentView:

```

customSubview.cg_cellContentViewManagerDisabled = YES;

```

### CocoaPods

Use with CocoaPods

```

pod 'CGCellContentViewManager', '1.0'

```

## License

MIT


