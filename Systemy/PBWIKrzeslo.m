#import "PBWIKrzeslo.h"
#import "PBWIZasob.h"

@implementation PBWIKrzeslo

@synthesize obicie = _obicie;

-(NSString *) opisZasobu{
	return [NSString stringWithFormat:@"Krzeslo obite %@ o kolorze: %@", _obicie, self.kolor];
}

@end

