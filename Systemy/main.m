#import <objc/objc.h>
#import <objc/Object.h>
#import <Foundation/Foundation.h>
#import "PBWIZasob.h"
#import "PBWIBiurko.h"
#import "PBWIKrzeslo.h"
#import "PBWIPokoj.h"
#import "PBWIZasobyWydzialu.h"


int main()
{
	@autoreleasepool {	
		PBWIZasob * zasob = [[PBWIZasob alloc] init];
		[zasob setKolor: @"szary"];
		NSLog(@"Przykladowy zasob: %@", [zasob opisZasobu]);
		PBWIBiurko * biurko = [[PBWIBiurko alloc] initWithParams:100 :80 :140];
		[biurko setKolor: @"brazowy"];
		NSLog(@"Przykladowe biurko: %@", [biurko opisZasobu]);
		PBWIKrzeslo * krzeslo = [[PBWIKrzeslo alloc] init];
		[krzeslo setObicie: @"skora"];
		[krzeslo setKolor: @"czarny"];
		NSLog(@"Przykladowe krzeslo: %@", [krzeslo opisZasobu]);

		PBWIPokoj *pokoj= [[PBWIPokoj alloc] init];
		[pokoj dodajZasob: biurko];
		[pokoj dodajZasob: krzeslo];
		[pokoj usunZasob: biurko];
        
        PBWIKrzeslo * krzeslo2 = [[PBWIKrzeslo alloc] init];
        PBWIKrzeslo * krzeslo3 = [[PBWIKrzeslo alloc] init];
        PBWIKrzeslo * krzeslo4 = [[PBWIKrzeslo alloc] init];
        PBWIBiurko * biurko2 = [[PBWIBiurko alloc] init];
        PBWIBiurko * biurko3 = [[PBWIBiurko alloc] init];
        PBWIBiurko * biurko4 = [[PBWIBiurko alloc] init];
        PBWIPokoj * pokoj2 = [[PBWIPokoj alloc] init];
        PBWIPokoj * pokoj3 = [[PBWIPokoj alloc] init];
        [pokoj2 dodajZasob:biurko2];
        [pokoj2 dodajZasob:krzeslo2];
        [pokoj2 dodajZasob:krzeslo3];
        PBWIZasobyWydzialu * zasoby = [[PBWIZasobyWydzialu alloc] init];
        [zasoby dodajPokoj:pokoj numer:101];
        [zasoby dodajPokoj:pokoj2 numer:102];
        [zasoby dodajPokoj:pokoj3 numer:103];
        [zasoby logujZawartosc];
        [zasoby dodajZasobDoPokoju:krzeslo4 numer:103];
        [zasoby dodajZasobDoPokoju:biurko3 numer:103];
        [zasoby dodajZasobDoPokoju:biurko3 numer:102];
        [zasoby dodajZasobDoPokoju:biurko4 numer:104];
        [zasoby logujZawartosc];
        [zasoby przeniesZasobDoPokoju:krzeslo do:103];
        [zasoby przeniesZasobDoPokoju:krzeslo do:104];
        [zasoby usunZasobZPokoju:krzeslo2 pokoj:101];
        [zasoby usunZasobZPokoju:krzeslo2 pokoj:102];
        [zasoby usunZasobZPokoju:krzeslo2 pokoj:102];
        [zasoby logujZawartosc];
        NSLog(@"%@", [zasoby wszystkieNrPokojow]);
        NSLog(@"%@", [zasoby wszystkieBiurka]);
        NSLog(@"%@", [zasoby wszystkieKrzesla]);
        
        
    }
	return 0;
}


