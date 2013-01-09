//
//  ViewController.m
//  kadai20130108
//
//  Created by 釜田 裕介 on 2013/01/08.
//  Copyright (c) 2013年 釜田 裕介. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDate *_now;

    NSCalendar *_calendar;
    NSDateComponents *_date;

    NSInteger _today;
}
@end

@implementation ViewController

const NSString *ArrWeek[] = {@"日", @"月", @"火", @"水", @"木", @"金", @"土"};

- (void)viewDidLoad
{
    NSLog(@"viewDidLoadTable");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myTableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];

    _now = [NSDate date];
    _calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    _date= [_calendar components:unitFlags fromDate:_now];
    
    _today = _date.day;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Table Header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"日付";
}

// Table Footer
- (NSString *)tableView:(UITableView *)tableView
titleForFooterInSection:(NSInteger)section {
    return @"";
}

// Number of Sections in a Table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Number of Lines in a Section
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSDate *now = [NSDate date];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger daysOfThisMonth = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:now].length;
    
    NSLog(@"%d",daysOfThisMonth);
    return daysOfThisMonth;
    
    //    return 50;
}

// Make a data for view line
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

//    NSInteger weekday = [date weekday] - 1;

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
//    }
	
//    cell.text = [NSString stringWithFormat:@"%@ %i", @"row", indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
 //       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }
    
    NSInteger day = (indexPath.row) + 1;
    
    // weekday
    [_date setDay:day];
    NSDate *lineDate = [_calendar dateFromComponents:_date];
    NSDateComponents *date = [_calendar components:NSWeekdayCalendarUnit fromDate:lineDate];
    NSInteger weekday = [date weekday] - 1; // 0=sunday,6=saturday
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d/%d/%d(%@)", _date.year, _date.month, day, ArrWeek[weekday]];
    
    // selected cell color
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = backgroundView;

    // today cell color
    UIColor *color = [UIColor whiteColor];
    UIColor *color2 = [UIColor blackColor];
    if (day == _today) {
        color = [UIColor colorWithRed:1.0 green:0.647 blue:0.0 alpha:1.0];
        color2 = [UIColor whiteColor];
    }
    cell.contentView.backgroundColor = color;
    cell.textLabel.backgroundColor = color;
    cell.textLabel.textColor = color2;
    
    return cell;
    
    
}
@end
