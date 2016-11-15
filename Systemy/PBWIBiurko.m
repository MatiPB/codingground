#import "PBWIBiurko.h"

@interface Klasa : NSObject{
   @private NSString * s;
}
@property(strong) NSString * s;
@end

@implementation PBWIBiurko
@synthesize wysokosc = _wysokosc;
@synthesize szerokosc = _szerokosc;
@synthesize dlugosc = _dlugosc;

-(id) initWithParams: (int)wys :(int)szer :(int)dl {
	self = [super init];
	if (self) {
		_wysokosc = wys;
		_szerokosc = szer;
		_dlugosc = dl;
	}
	return self;
}
-(NSString *) opisZasobu {
	return [NSString stringWithFormat:@"Biurko o kolorze: %@", self.kolor];
}


@end


