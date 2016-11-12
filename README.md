# CGCellContentViewManager

## Doc

English Doc **·** [中文文档](https://github.com/CoderGin/CGCellContentViewManager/blob/master/README-Chinese.md)

---

## Overview

![Overview.gif](https://raw.githubusercontent.com/CoderGin/CGCellContentViewManager/master/Overview.gif)

### Introduction

An elegant way to solve the problem while we're clicking a UITableViewCell, the subviews in the cell's contentView's backgroundColor changed unexpected.

**A common Solution**

Disable the native cell's selection style:

```

cell.selectionStyle = UITableViewCellSelectionStyleNone;

```

And then add a button to cover the cell's contentView, to imitate the native selection style.

But it seems to be a little complex.

**Try CGCellContentViewManager! It can keep you away from these unnecessary troubles**

## Usage

Just add 2 files

- CGCellContentViewManager/UIView+CGCellContentViewManager.h
- CGCellContentViewManager/UIView+CGCellContentViewManager.m

to your project, and needn't for any setups. All the subviews in the cell's contentView will never change backgroundColor while we're clicking the cell.

To disable the CGCellContentViewManager's auto-work for a cell:

```

cell.cg_cellContentViewManagerDisabled = YES;

```

To disable the CGCellContentViewManager's auto-work for a subview in cell's contentView:

```

customSubview.cg_cellContentViewManagerDisabled = YES;

```

### CocoaPods

Sorry, the CGCellContentViewManager not supports for Cocoapods now!

Please drag the 

- CGCellContentViewManager/UIView+CGCellContentViewManager.h
- CGCellContentViewManager/UIView+CGCellContentViewManager.m

2 files into your project manually.

## License

MIT


