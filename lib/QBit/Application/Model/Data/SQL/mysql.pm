package QBit::Application::Model::Data::SQL::mysql;

use qbit;

use base qw(QBit::Application::Model::Data::SQL);

__PACKAGE__->model_accessors(db => 'QBit::Application::Model::DB::mysql');

sub _get_fields_namespace {'QBit::Application::Model::Data::SQL::mysql::_::Field'}

TRUE;
