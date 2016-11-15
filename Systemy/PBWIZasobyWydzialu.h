#ifndef PBWIZasobyWydzialu_h
#define PBWIZasobyWydzialu_h

#import <Foundation/Foundation.h>

@interface PBWIZasobyWydzialu : NSObject {
@private NSMutableDictionary* nrPokojuNaPokoj;
@private NSMutableArray* zasoby;
@private NSMutableDictionary* zasobNaNrPokoju;
}

-(id) init;
-(void) dodajPokoj: (PBWIPokoj *) pokoj numer:(int)nrPokoju;
-(void) dodajZasobDoPokoju: (PBWIZasob *) zasob numer:(int)nrPokoju;
-(void) przeniesZasobDoPokoju: (PBWIZasob *) zasob do:(int)nrPokoju;
-(void) usunZasobZPokoju: (PBWIZasob *) zasob pokoj:(int)nrPokoju;
-(NSArray *) numeryPokojow;
-(NSArray *) biurka;
-(NSArray *) krzesla;
-(void) logujZawartosc;

@end

#endif /* PBWIZasobyWydzialu_h */
