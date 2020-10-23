//
//  MyTableViewController.m
//  LetsGoTes
//
//  Created by 花泽真菜 on 2020/10/23.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadMealData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)loadMealData {
    _mealList = [[NSMutableArray alloc] init];
    UIImage *img1 = [UIImage imageNamed:@"sample1.jpeg"];
    UIImage *img2 = [UIImage imageNamed:@"sample2.jpeg"];
    UIImage *img3 = [UIImage imageNamed:@"sample3.jpeg"];
    UIImage *img4 = [UIImage imageNamed:@"sample4.jpeg"];
    UIImage *img5 = [UIImage imageNamed:@"sample5.jpeg"];
    Meal *meal1 = [[Meal alloc]initWithName:@"s1" andImage:img1 andRating:5];
    Meal *meal2 = [[Meal alloc]initWithName:@"s2" andImage:img2 andRating:4];
    Meal *meal3 = [[Meal alloc]initWithName:@"s3" andImage:img3 andRating:3];
    Meal *meal4 = [[Meal alloc]initWithName:@"s4" andImage:img4 andRating:1];
    Meal *meal5 = [[Meal alloc]initWithName:@"s5" andImage:img5 andRating:2];
    [self.mealList addObject:meal1];
    [self.mealList addObject:meal2];
    [self.mealList addObject:meal3];
    [self.mealList addObject:meal4];
    [self.mealList addObject:meal5];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.mealList.count - 2;
    } else {
        return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    Meal *meal;
    if (indexPath.section == 0) {
        meal = [_mealList objectAtIndex:indexPath.row];
    } else {
        meal = [_mealList objectAtIndex:(_mealList.count - 2 + indexPath.row)];
    }
    cell.label.text = meal.name;
    cell.image.image = meal.image;
    cell.ratingStar.rating = meal.rating;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5.0f;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
