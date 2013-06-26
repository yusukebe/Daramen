+{
    connect_info => [
        'dbi:mysql:daramen:localhost',
        'root', undef,
        {
            RaiseError => 1,
            PrintError => 0,
            AutoCommit => 1,
        }
    ],
    twitter => {
        consumer_key    => '',
        consumer_secret => '',
        access_token    => '',
        access_token_secret => '',
    }
};
