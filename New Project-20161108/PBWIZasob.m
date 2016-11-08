#import "PBWIZasob.h"

@implementation PBWIZasob

@synthesize kolor = _kolor;

-(NSString *) opisZasobu {
	return [NSString stringWithFormat:@"Jakis zasob o kolorze: %@", _kolor];
}

@end
