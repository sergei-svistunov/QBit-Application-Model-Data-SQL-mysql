package TestApplication::Model::Users;

use qbit;

use base qw(QBit::Application::Model::Data::SQL::mysql);

__PACKAGE__->model_accessors(user_contacts => 'TestApplication::Model::UserContacts');

sub _fields_ {
    return (
        id => {type => 'int', default => TRUE, unsigned => TRUE, auto_increment => TRUE, caption => 'User ID'},
        name       => {type => 'varchar', default => TRUE, length  => 63, caption => d_gettext('Name')},
        email      => {type => 'varchar', length  => 255,  caption => d_gettext('EMail')},
        full_email => {
            type       => 'code',
            depends_on => [qw(name email)],
            get        => sub {
                my ($model, $rec) = @_;
                return "$rec->{'name'} <$rec->{'email'}>";
              }
        },
        dep_l2 => {
            type         => 'code',
            check_rights => ['users_view_dep_l2'],
            depends_on   => 'full_email',
            get          => sub {
                return "$_[1]->{'full_email'}|l2";
              }
        },
        dep_l3 => {
            type       => 'code',
            depends_on => 'dep_l2',
            get        => sub {
                return "$_[1]->{'dep_l2'}|l3";
              }
        },
        forced_dep => {
            type              => 'code',
            depends_on        => 'id',
            forced_depends_on => 'dep_l3',
            get               => sub {
                return "$_[1]->{'id'}|" . md5_hex($_[1]->{'dep_l2'});
              }
        },
        additional_contacts => {
            type        => 'ext_model',
            from        => 'user_contacts',
            join_fields => [['id'] => ['id']],
        }
    );
}

sub _pk_ {'id'}
sub _sql_indexes_ {return ({fields => ['email'], unique => TRUE})}

TRUE;
