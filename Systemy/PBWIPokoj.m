#import "PBWIPokoj.h"
#import "PBWIZasob.h"

@implementation PBWIPokoj

-(id) init {
	self = [super init];
	if (self) {
		_zasoby=[[NSMutableArray alloc] init];
	}
	return self;
}
-(void) dodajZasob: (PBWIZasob *) zasob {
	[_zasoby addObject:zasob];
}
-(void) usunZasob: (PBWIZasob *) zasob {
	[_zasoby removeObject:zasob];
}
-(NSArray *) wszystkieZasoby {
	return [_zasoby copy];
}

@end
