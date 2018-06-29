# AlertContainerObjC 弹窗容器类

```
- 依赖Masonry约束布局

- 自定义contentView，并要求可计算高度的约束布局
- 如：contentView中底部控件必须提供高度，以及bottom的低优先级约束
```
 make.height.mas_equalTo(scaleY(44.0f));
 make.bottom.equalTo(self).priorityLow();
```

- DEMO查看详情！！！
```
