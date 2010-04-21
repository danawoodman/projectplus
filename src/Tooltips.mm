@implementation NSWindowController (Tooltips)
- (NSString*)outlineView:(NSOutlineView*)anOutlineView toolTipForCell:(NSCell*)aCell rect:(NSRectPointer)aRectPointer tableColumn:(NSTableColumn*)aTableColumn item:(id)anId mouseLocation:(NSPoint)aPoint
{
	if(not [[NSUserDefaults standardUserDefaults] boolForKey:@"ProjectPlus Tooltips Enabled"])
		return nil;

	NSString *name = [anId objectForKey:@"displayName"];
	NSSize nameSize = [name sizeWithAttributes:nil];
	// Only return a string if we're larger than the visible space
	if (aRectPointer->size.width <= nameSize.width)
		return name;
	else
		return nil;
}
@end

@interface ProjectPlus_Tooltips : NSObject
@end

@implementation ProjectPlus_Tooltips
+ (void)load
{
	[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:@"ProjectPlus Tooltips Enabled"]];
}
@end