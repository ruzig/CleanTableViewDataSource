CleanTableViewDataSource
========================

Use this to write a clean TableView DataSource. Inspired from: [objC.io - Clean table view code ](http://www.objc.io/issue-1/table-views.html).

Usages
======

Just init an instance of OAArrayDataSource and pass it to yourtableview.datasource.
```Objective-C
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, id item) {
        //Configure cell within this block.
        //If there are many types of cell, write more blocks or functions to 
        //configure cell depending on the item passing.
        cell.textLabel.text = [item stringValue];
    };
    IdentifierParserBlock identifierParserBlock = ^NSString *(id item) {
        //Depend on item data, return the right cell identifier here.
        return kNumberCellIdentifier;
    };
    //Remember to define @property (strong, nonatomic) OAArrayDataSource *arrayDataSource
    self.arrayDataSource = [[OAArrayDataSource alloc] initWithItems:self.numbers
                                          identifierParserBlock:identifierParserBlock
                                             configureCellBlock:configureCell];
    self.yourTableView.dataSource = arrayDataSource;
```
To customize the cell, feel free to subclass OAArrayDataSource and override the method: 
```Objective-C
  - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    //Customize your cell here
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;

  }
```

Getting it
==========

The best way to get Kiwi is by using [CocoaPods](https://github.com/cocoapods/cocoapods).
```
  pod 'CleanTableViewDataSource'
```
Then, import it

```
    #import <OAArrayDataSource.h>
```
