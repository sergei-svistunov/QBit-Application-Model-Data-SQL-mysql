package TestApplication;

use qbit;

use base qw(QBit::Application);

__PACKAGE__->config_opts(
    preload_accessors => TRUE,

    db => {host => '127.0.0.1', user => 'debian-sys-maint', password => 'uSguaJ0mXMRYTH3H'},
);

use QBit::Application::Model::DB::mysql accessor  => 'db';
use TestApplication::Model::UserContacts accessor => 'user_contacts';
use TestApplication::Model::Users accessor        => 'users';

TRUE;
