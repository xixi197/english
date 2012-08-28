//
//  ViewController.m
//  english
//
//  Created by xixi197 on 12-8-26.
//  Copyright (c) 2012年 xixi197. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    NSMutableArray *_keys;
    NSMutableDictionary *_allWords;
    NSMutableDictionary *_newWords;
    NSMutableDictionary *_showWords;
    IBOutlet UISegmentedControl *_segControl;
    IBOutlet UITableView *_tableView;
    IBOutlet UILabel *_countLabel;
}

- (void)viewDidLoad
{
    NSString *allPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/allWords.json"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:allPath]) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"allWords" ofType:@"json"];
        [[NSFileManager defaultManager] copyItemAtPath:resourcePath toPath:allPath error:nil];
    }

    NSData *allData = [NSData dataWithContentsOfFile:allPath];
    
    NSError *error;
    _allWords = [[NSJSONSerialization JSONObjectWithData:allData options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&error] mutableCopy];
    
    NSString *newPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/newWords.json"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:newPath]) {
        _newWords = [NSMutableDictionary dictionaryWithCapacity:10];
    } else {
        NSData *newData = [NSData dataWithContentsOfFile:newPath];
        _newWords = [[NSJSONSerialization JSONObjectWithData:newData options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:nil] mutableCopy];
    }

    [self change:nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return interfaceOrientation != UIDeviceOrientationPortraitUpsideDown;
    } else {
        return YES;
    }
}

- (IBAction)random:(id)sender {
    NSUInteger count = [_keys count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [_keys exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    [_tableView reloadData];
}

- (IBAction)change:(id)sender {
    if (_segControl.selectedSegmentIndex == 0) {
        _showWords = _allWords;
    } else {
        _showWords = _newWords;
    }
    _keys = [[_showWords allKeys] mutableCopy];
    _countLabel.text = [[NSNumber numberWithInt:_keys.count] description];
    [self random:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [_keys objectAtIndex:indexPath.row];
    if ([_newWords objectForKey:key]) {
        [_newWords removeObjectForKey:key];
        if (_segControl.selectedSegmentIndex == 1) {
            [_keys removeObjectAtIndex:indexPath.row];
            _countLabel.text = [[NSNumber numberWithInt:_keys.count] description];
        }
    } else {
        [_newWords setObject:[_showWords objectForKey:key] forKey:key];
    }
    
    [_tableView reloadData];

    NSString *newPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/newWords.json"];
    NSData *newDate =[NSJSONSerialization dataWithJSONObject:_newWords options:0 error:0];
    [newDate writeToFile:newPath atomically:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _keys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"wordsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *key = [_keys objectAtIndex:indexPath.row];
    NSString *value = [_showWords objectForKey:key];

    cell.textLabel.text = key;
    cell.detailTextLabel.text = value;
    
    if ([_newWords objectForKey:key]) {
        cell.textLabel.textColor = [UIColor orangeColor];
    } else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

@end
