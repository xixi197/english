//
//  ViewController.m
//  english
//
//  Created by xixi197 on 12-8-26.
//  Copyright (c) 2012年 xixi197. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    NSMutableArray *_words;
    IBOutlet UITableView *_tableView;
}

- (void)viewDidLoad
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"words.json" ofType:nil]];
    
    NSError *error;
    _words = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] mutableCopy];

    [self random:nil];
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
    NSUInteger count = [_words count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [_words exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"wordsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.detailTextLabel.text  = [[_words objectAtIndex:indexPath.row] objectForKey:@"vv"];
    cell.textLabel.text = [[_words objectAtIndex:indexPath.row] objectForKey:@"word"];
    return cell;
}

@end
