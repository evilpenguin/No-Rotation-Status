/*
 * No Rotation Status
 * Created by EvilPenguin|
 * Open Sourced
 * Removes Rotation StatusBar Icon :)
 *
 *
 *
 */

#pragma mark -
#pragma mark == Interface for class methods==

@interface UIStatusBarItem
- (id)indicatorName;	
@property(readonly, assign, nonatomic) NSString *indicatorName;
@end

@interface UIStatusBarItemView
+ (id)createViewForItem:(id)item foregroundStyle:(int)style;
+ (id)createViewForItem:(id)item withData:(id)data actions:(int)actions foregroundStyle:(int)style;
@end

#pragma mark -
#pragma mark == Magical H

%hook UIStatusBarItemView
// 4.2.1
+ (id)createViewForItem:(id)item withData:(id)data actions:(int)actions foregroundStyle:(int)style {
	UIStatusBarItem *statusItem = item;
	if ([[statusItem indicatorName] isEqualToString:@"RotationLock"]) { return nil; }
	return %orig;
}

// 4.0 && 4.1
+ (id)createViewForItem:(id)item foregroundStyle:(int)style {
	UIStatusBarItem *statusItem = item;
	if ([[statusItem indicatorName] isEqualToString:@"RotationLock"]) { return nil; }
	return %orig;
}
%end