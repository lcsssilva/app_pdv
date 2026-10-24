

const url = "http://192.168.1.105/api/";

// Quando true, as chamadas para a api são respondidas pelos arquivos da pasta jsons/.
// Para usar a api real: flutter run --dart-define=MOCK_API=false
const mockApi = bool.fromEnvironment('MOCK_API', defaultValue: true);
