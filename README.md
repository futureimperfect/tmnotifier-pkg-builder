# TMNotifier PKG Scripts

These scripts can be used to build a custom [TMNotifier][1] PKG for deployment within your organization. Just place the TMNotifier.app bundle in `build/Applications` and then run the `create_pkg` script.

## Usage

`./create_pkg -i 3 -o -a -w -l -f 'smtp@example.com' -s 'smtp.example.com' -t 'one@example.com' -t 'two@example.com' -u 'smtp@example.com' -p 'supersecret'`

    usage: create_pkg [-h] [-i INTERVAL] [-o] [-w] [-l] [-a] [-f SMTP_FROM]
                      [-s SMTP_SERVER] [-t SMTP_TO] [-u SMTP_USERNAME]
                      [-d DISPLAY_STYLE] [-p SMTP_PASSWORD]

    Create deployment PKG for TMNotifier.

    optional arguments:
      -h, --help            show this help message and exit
      -i INTERVAL, --interval INTERVAL
                            How often TMNotifier should check for errors.
      -o, --hours           Use hours instead of minutes as the interval unit.
      -w, --hide-welcome-window
                            Hide the TMNotifier "Welcome" window on launch.
      -l, --launch-at-login
                            Authorize TMNotifier to launch at login.
      -a, --smtp-authentication-enabled
                            Whether to use SMTP authentication.
      -f SMTP_FROM, --smtp-from SMTP_FROM
                            The email to send TMNotifier alerts from.
      -s SMTP_SERVER, --smtp-server SMTP_SERVER
                            The SMTP server to send alerts from.
      -t SMTP_TO, --smtp-to SMTP_TO
                            The email address(es) to send the alerts to. This
                            option can be used multiple times for additional email
                            addresses.
      -u SMTP_USERNAME, --smtp-username SMTP_USERNAME
                            The SMTP username used for sending email notifications
                            in TMNotifier.
      -d DISPLAY_STYLE, --display-style DISPLAY_STYLE
                            Configure TMNotifier's display options. 1 = Menu bar
                            only 2 = Dock icon only 3 = Menu bar + Dock icon
      -p SMTP_PASSWORD, --smtp-password SMTP_PASSWORD
                            The SMTP password used for sending email notifications
                            in TMNotifier.

[1]: https://tmnotifier.com/
