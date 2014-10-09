use FindBin '$Bin';
use lib "$Bin/lib", "$Bin/../lib", "$Bin/../../QBit-Application-Model-Data-SQL/lib",
  "$Bin/../../QBit-Application-Model-Data/lib", "$Bin/../../QBit-Application/lib";

use Test::More;
use Test::Deep;

use qbit;

BEGIN {use_ok('TestApplication')}
my $app = new_ok('TestApplication');

$app->pre_run();

use DDP;
p $app->db->create_sql;
#p $app->get_models();
#p $app->users;

$app->post_run();

done_testing();
