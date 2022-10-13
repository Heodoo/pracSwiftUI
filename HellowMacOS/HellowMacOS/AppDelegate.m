//
//  AppDelegate.m
//  HellowMacOS
//
//  Created by 허두영 on 2022/10/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *myButton;
- (IBAction)pressButton:(id)sender;
@property (weak) IBOutlet NSTextFieldCell *myTextField;
- (void)initItems;
@property (weak) IBOutlet NSTextFieldCell *myTextFieldCell;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self initItems];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)pressButton:(id)sender {
    NSString* string = [self.myTextFieldCell title];
    NSLog(@"%@",self.myTextFieldCell.title);
    [self.myTextField setTitle: string];
    
    NSSpeechSynthesizer* synthesizer = [[NSSpeechSynthesizer alloc] init];
    [synthesizer startSpeakingString:string];
    
}
-(void)initItems{
    NSString* string = @"WAIT...";
    [self.myTextField setTitle: string];
    [self.myTextFieldCell setTitle: @"INPUT YOUR TEXT"];
    [self.myButton setTitle:@"SAY HELLO"];
}

@end

