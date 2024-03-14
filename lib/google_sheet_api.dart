import 'package:gsheets/gsheets.dart';

class GoogleSheetAPi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "tactical-sonar-416314",
  "private_key_id": "20ef4bcbf74e7a9a51a198d638853dbff9399db2",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDvz0/PSI5lC7X9\n5vfdBfC/Coz/c5j8rVASMmHhKI6qff/nDKfHRhq70lGC7cbgaI+s9SVeivhrW8PR\nVXckEw4EW0a6JMbf43N2i+cKwW333pljqVN9KWfrBOV5IBDlxpmqAdaGwseJaVR1\nK8WYADzmqyVCXtCTsHh0qtFC8XRHaPCQYaX/taD5IsB6lgi3wn9mrVnVQ9gQ7IPj\nbhzUCkxj97lr7Z/M7Pij6RufmJ7HDtpcKvFDJNBj4jZImls2UlI3ri3I76VrDuSa\nt3RegRaPr81kYyLuoo4Fb6tefgufB7rI0/ojBzpAoBrwBbsU3GySxW4QAI7zd5h7\n+hpM/heRAgMBAAECggEAFo8i58HgdFi7TnbsdQA2rzARxsOj/gwbQtT2wHjBYABB\noyV9gIljoSzWMmoGGgz4DBoVIX1TBH1x0LbYof4BZO9FumPUihICZgHf8pLy8n0A\nIsAWbKkpH5KauC/oKwdpY/TvjoaTAQYVtf6PxF5sXDo4I3PaLPSORlJd5G1kpgVm\ncKuphtxHeNZLfiufFwNXF/0U8sJ6/jErMBdjg0i9SfqPgk9ngPuZiGCBc0cKvQJz\n9kb2VDXqI1HBZcVX2CqSHMYFYciikL46wk878XDuFN9HsXus0GFL37JiF3z89yp5\n83MMR3KK9ptDjXAg/GBSiOtYdbPT/qDcacQnkudPCQKBgQD8uOEDzcB8A7ceaaYp\n5N1RZv5386vWLaRGg0OH6vlLZLcMvSFD5RiT+lqC8uOcUt3+Hcbm/yeWYyazDAaT\nJnNW5vVyoxdf6S1B56G15yIi30THUTbupuTXgJWMnAHtAcGt/mLwTzaD7CjmXvJb\nNwTsovXnqYKismcXvY+k1OLlaQKBgQDy6484lVe790MqKtfZMRWvf4XRXdIWvGy3\n4Y/epPznPkLRl7BKmEVRGbDRuiKbJpHPNhLV8YiKU4kZTDYem5eR3d286l8bGddm\nWnPU9F+cM4kW6YuVKIv+PctCGMCqxZiC9eLPP205hLuhTzTAofJD/f77QHWpbFqb\nEzcYYsCT6QKBgQDcCIvBKA8C6qkwzYNizmTzTt0Xyww9uhdhXUAawrayscm+SZ0A\n5CJ2FG9hu9/4Zx3o9jwLOvRYt5MmKL5AuCWL8CKb4OulEfvZebcODWNnQUU81LUj\nLCPqjYWnmt0CYZkjyGyUFiO80Iz7pocUa97ZuTiorqmSxgmEXgMG3GOAoQKBgQDl\nQAtc0gwHVxWqwN4NmfYmNsn6SXmQfWh4rMWSz8/hB/AVTvtPmp6oJ/+oHeq001R9\n4kEqaRR7vtQ+7J6SijIjteeidukkcWHHtYtlKO7mQfiZh/Rz4t0jJfwht6x0PaBt\nz1GqVuhkhPByDobxWKSDKDyvryibqKdlfF/dgqzNqQKBgQCwLJ7LQiT1ubx76epg\npn5kbE5U/WKA3aYCpUriRlkkAcH/KzVzVYbLovX4mi1X1Kfc0TulOWq4YCKR33Cx\nxBJiXwHYzfmudux2WfdyW+q/hhTEngyXFyaS42rfxpXKE4yerB5hX3Z0y+r053/L\nZbFJrrD6Chs7jiE7FxZxugheaw==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-g-sheets@tactical-sonar-416314.iam.gserviceaccount.com",
  "client_id": "105136263365705750256",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-g-sheets%40tactical-sonar-416314.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

  static final _spreadsheetid = '1TTIBqE4qyHHEKUOmmTU11P9fbsmRpuGr6C9jP3Ainpw';
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _worksheet;

  Future init() async {
    final ss = await _gsheet.spreadsheet(_spreadsheetid);
    _worksheet = ss.worksheetByTitle('Worksheet1');
  }
}
