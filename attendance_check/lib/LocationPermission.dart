enum locPermission {
  locationServiceDisabled(message: '위치 정보 사용을 켜주세요.'),
  denied(message: '위치 정보 사용을 허용해주세요.'),
  granted(message: '위치 정보 권한을 확인했습니다. '),
  deniedForever(message: '앱 설정에 들어가서 위치 정보 사용을 허용해주세요.');
  // unknown;

  const locPermission({
    required this.message,
  });

  final String message;
}
