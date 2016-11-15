#import "PBWIKrzeslo.h"
#import "PBWIZasob.h"

@interface PBWIKrzeslo : PBWIZasob{
   @private NSString * _obicie;
}
@property(strong) NSString * obicie;

-(NSString *) opisZasobu;


@end

