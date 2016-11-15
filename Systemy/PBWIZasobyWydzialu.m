//
//  PBWIZasobyWydzialu.m
//  SM3
//
//  Created by student on 18.10.2016.
//  Copyright © 2016 student. All rights reserved.
//

#import "PBWIPokoj.h"
#import "PBWiBiurko.h"
#import "PBWiKrzeslo.h"
#import "PBWIZasobyWydzialu.h"
#import <Foundation/Foundation.h>

@implementation PBWIZasobyWydzialu : NSObject

-(id) init {
    self = [super init];
    if (self) {
        nrPokojuNaPokoj=[[NSMutableDictionary alloc] init];
        zasoby = [[NSMutableArray alloc] init];
        zasobNaNrPokoju = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void) dodajPokoj: (PBWIPokoj *)pokoj numer:(int)nrPokoju {
    [nrPokojuNaPokoj setObject:pokoj forKey:@(nrPokoju)];
    for (PBWIZasob * zasob in [pokoj wszystkieZasoby]) {
        [zasoby addObject:zasob];
        [zasobNaNrPokoju setObject:@(nrPokoju) forKey:[NSValue valueWithNonretainedObject:zasob]];
    }
}

-(void) dodajZasobDoPokoju: (PBWIZasob *) zasob numer:(int)nrPokoju {
    if ([zasoby containsObject:zasob]) {
        NSLog(@"Ten zasob zostal juz dodany!");
        return;
    }
    PBWIPokoj * pokoj = [nrPokojuNaPokoj objectForKey:@(nrPokoju)];
    if (pokoj == nil) {
        NSLog(@"Pokoj o danym numerze nie istnieje!");
        return;
    }
    [pokoj dodajZasob:zasob];
    [zasobNaNrPokoju setObject:@(nrPokoju) forKey:[NSValue valueWithNonretainedObject:zasob]];
    [zasoby addObject:zasob];
}

-(void) przeniesZasobDoPokoju: (PBWIZasob *) zasob do:(int)nrPokoju {
    id staryNrPokoju = [zasobNaNrPokoju objectForKey:[NSValue valueWithNonretainedObject:zasob]];
    if (staryNrPokoju == nil) {
        NSLog(@"Nie znaleziono zadanego zasobu!");
        return;
    }
    PBWIPokoj * staryPokoj = [nrPokojuNaPokoj objectForKey:@([staryNrPokoju integerValue])];
    PBWIPokoj * nowyPokoj = [nrPokojuNaPokoj objectForKey:@(nrPokoju)];
    if (staryPokoj != nil && nowyPokoj != nil) {
        [staryPokoj usunZasob:zasob];
        [nowyPokoj dodajZasob:zasob];
        [zasobNaNrPokoju setObject:@(nrPokoju) forKey:[NSValue valueWithNonretainedObject:zasob]];
    }
}

-(void) usunZasobZPokoju: (PBWIZasob *) zasob pokoj:(int)nrPokoju {
    if (![zasoby containsObject:zasob]) {
        NSLog(@"Nie znaleziono zadanego zasobu!");
        return;
    }
    id nrPokojuZasobu = [zasobNaNrPokoju objectForKey:[NSValue valueWithNonretainedObject:zasob]];
    if (nrPokoju != [nrPokojuZasobu intValue]) {
        NSLog(@"Ten zasob nie nalezy do podanego pokoju!");
        return;
    }
    
    PBWIPokoj * pokoj = [nrPokojuNaPokoj objectForKey:@(nrPokoju)];
    [pokoj usunZasob:zasob];
    [zasoby removeObject:zasob];
    [zasobNaNrPokoju removeObjectForKey:[NSValue valueWithNonretainedObject:zasob]];
    
}

-(NSArray *) numeryPokojow {
    NSMutableArray * lista = [[NSMutableArray alloc] init];
    NSArray * keys = [nrPokojuNaPokoj allKeys];
    for (id nrPokoju in keys) {
        int numer = [nrPokoju intValue];
        [lista addObject:@(numer)];
    }
    return lista;
}

-(NSArray *) biurka {
    NSMutableArray * lista = [[NSMutableArray alloc] init];
    for (id object in zasoby) {
        if ([object isKindOfClass:[PBWIBiurko class]]) {
            [lista addObject:object];
        }
    }
    return lista;
}

-(NSArray *) krzesla {
    NSMutableArray * lista = [[NSMutableArray alloc] init];
    for (id object in zasoby) {
        if ([object isKindOfClass:[PBWIKrzeslo class]]) {
            [lista addObject:object];
        }
    }
    return lista;
}

-(void) logujZawartosc {
    NSLog(@"Numery pokojow:");
    NSLog(@"%@", [nrPokojuNaPokoj description]);
    NSLog(@"Zasoby:");
    NSLog(@"%@", [zasoby description]);
    NSLog(@"Numery pokojow przydzielone zasobom:");
    NSLog(@"%@", [zasobNaNrPokoju description]);
}

@end
