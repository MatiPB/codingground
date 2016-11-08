#import "PBWIBiurko.h"
#import "PBWIZasob.h"

@interface PBWIBiurko : PBWIZasob{
   @private int _wysokosc;
   @private int _szerokosc;
   @private int _dlugosc;
}
@property(readonly) int wysokosc;
@property(readonly) int szerokosc;
@property(readonly) int dlugosc;

-(id) initWithParams: (int)wys :(int)szer :(int)dl;
-(NSString *) opisZasobu;


@end



