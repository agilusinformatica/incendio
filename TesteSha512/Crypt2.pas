unit Crypt2;

interface

type

HCkSecureString = Pointer;
HCkStringBuilder = Pointer;
HCkCert = Pointer;
HCkCrypt2 = Pointer;
HCkString = Pointer;
HCkXmlCertVault = Pointer;
HCkByteData = Pointer;
HCkStream = Pointer;
HCkPrivateKey = Pointer;
HCkHttp = Pointer;
HCkTask = Pointer;
HCkJsonObject = Pointer;
HCkCertChain = Pointer;
HCkBinData = Pointer;


function CkCrypt2_Create: HCkCrypt2;
procedure CkCrypt2_Dispose(handle: HCkCrypt2);
function CkCrypt2_getAbortCurrent(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putAbortCurrent(objHandle: HCkCrypt2; newPropVal: wordbool);
function CkCrypt2_getBCryptWorkFactor(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putBCryptWorkFactor(objHandle: HCkCrypt2; newPropVal: Integer);
function CkCrypt2_getBlockSize(objHandle: HCkCrypt2): Integer;
function CkCrypt2_getCadesEnabled(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putCadesEnabled(objHandle: HCkCrypt2; newPropVal: wordbool);
procedure CkCrypt2_getCadesSigPolicyHash(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCadesSigPolicyHash(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__cadesSigPolicyHash(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCadesSigPolicyId(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCadesSigPolicyId(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__cadesSigPolicyId(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCadesSigPolicyUri(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCadesSigPolicyUri(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__cadesSigPolicyUri(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCharset(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCharset(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__charset(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCipherMode(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCipherMode(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__cipherMode(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCmsOptions(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCmsOptions(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__cmsOptions(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCompressionAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCompressionAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__compressionAlgorithm(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getCryptAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putCryptAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__cryptAlgorithm(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getDebugLogFilePath(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putDebugLogFilePath(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__debugLogFilePath(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getEncodingMode(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putEncodingMode(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__encodingMode(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getFirstChunk(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putFirstChunk(objHandle: HCkCrypt2; newPropVal: wordbool);
procedure CkCrypt2_getHashAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putHashAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__hashAlgorithm(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getHavalRounds(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putHavalRounds(objHandle: HCkCrypt2; newPropVal: Integer);
function CkCrypt2_getHeartbeatMs(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putHeartbeatMs(objHandle: HCkCrypt2; newPropVal: Integer);
function CkCrypt2_getIncludeCertChain(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putIncludeCertChain(objHandle: HCkCrypt2; newPropVal: wordbool);
function CkCrypt2_getInitialCount(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putInitialCount(objHandle: HCkCrypt2; newPropVal: Integer);
function CkCrypt2_getIterationCount(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putIterationCount(objHandle: HCkCrypt2; newPropVal: Integer);
procedure CkCrypt2_getIV(objHandle: HCkCrypt2; outPropVal: HCkByteData);
procedure CkCrypt2_putIV(objHandle: HCkCrypt2; newPropVal: HCkByteData);
function CkCrypt2_getKeyLength(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putKeyLength(objHandle: HCkCrypt2; newPropVal: Integer);
function CkCrypt2_getLastChunk(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putLastChunk(objHandle: HCkCrypt2; newPropVal: wordbool);
procedure CkCrypt2_getLastErrorHtml(objHandle: HCkCrypt2; outPropVal: HCkString);
function CkCrypt2__lastErrorHtml(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getLastErrorText(objHandle: HCkCrypt2; outPropVal: HCkString);
function CkCrypt2__lastErrorText(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getLastErrorXml(objHandle: HCkCrypt2; outPropVal: HCkString);
function CkCrypt2__lastErrorXml(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getLastMethodSuccess(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putLastMethodSuccess(objHandle: HCkCrypt2; newPropVal: wordbool);
procedure CkCrypt2_getMacAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putMacAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__macAlgorithm(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getNumSignerCerts(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_getOaepHash(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putOaepHash(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__oaepHash(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getOaepMgfHash(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putOaepMgfHash(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__oaepMgfHash(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getOaepPadding(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putOaepPadding(objHandle: HCkCrypt2; newPropVal: wordbool);
function CkCrypt2_getPaddingScheme(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putPaddingScheme(objHandle: HCkCrypt2; newPropVal: Integer);
procedure CkCrypt2_getPbesAlgorithm(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putPbesAlgorithm(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__pbesAlgorithm(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getPbesPassword(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putPbesPassword(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__pbesPassword(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getPkcs7CryptAlg(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putPkcs7CryptAlg(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__pkcs7CryptAlg(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getRc2EffectiveKeyLength(objHandle: HCkCrypt2): Integer;
procedure CkCrypt2_putRc2EffectiveKeyLength(objHandle: HCkCrypt2; newPropVal: Integer);
procedure CkCrypt2_getSalt(objHandle: HCkCrypt2; outPropVal: HCkByteData);
procedure CkCrypt2_putSalt(objHandle: HCkCrypt2; newPropVal: HCkByteData);
procedure CkCrypt2_getSecretKey(objHandle: HCkCrypt2; outPropVal: HCkByteData);
procedure CkCrypt2_putSecretKey(objHandle: HCkCrypt2; newPropVal: HCkByteData);
procedure CkCrypt2_getSigningAlg(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putSigningAlg(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__signingAlg(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getSigningAttributes(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putSigningAttributes(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__signingAttributes(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getUncommonOptions(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putUncommonOptions(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__uncommonOptions(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getUuFilename(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putUuFilename(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__uuFilename(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_getUuMode(objHandle: HCkCrypt2; outPropVal: HCkString);
procedure CkCrypt2_putUuMode(objHandle: HCkCrypt2; newPropVal: PWideChar);
function CkCrypt2__uuMode(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_getVerboseLogging(objHandle: HCkCrypt2): wordbool;
procedure CkCrypt2_putVerboseLogging(objHandle: HCkCrypt2; newPropVal: wordbool);
procedure CkCrypt2_getVersion(objHandle: HCkCrypt2; outPropVal: HCkString);
function CkCrypt2__version(objHandle: HCkCrypt2): PWideChar;
procedure CkCrypt2_AddEncryptCert(objHandle: HCkCrypt2; cert: HCkCert);
function CkCrypt2_AddPfxSourceData(objHandle: HCkCrypt2; pfxBytes: HCkByteData; pfxPassword: PWideChar): wordbool;
function CkCrypt2_AddPfxSourceFile(objHandle: HCkCrypt2; pfxFilePath: PWideChar; pfxPassword: PWideChar): wordbool;
function CkCrypt2_AddSigningCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool;
function CkCrypt2_AesKeyUnwrap(objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__aesKeyUnwrap(objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar): PWideChar;
function CkCrypt2_AesKeyWrap(objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__aesKeyWrap(objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar): PWideChar;
function CkCrypt2_BCryptHash(objHandle: HCkCrypt2; password: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__bCryptHash(objHandle: HCkCrypt2; password: PWideChar): PWideChar;
function CkCrypt2_BCryptVerify(objHandle: HCkCrypt2; password: PWideChar; bcryptHash: PWideChar): wordbool;
function CkCrypt2_BytesToString(objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__bytesToString(objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar): PWideChar;
function CkCrypt2_ByteSwap4321(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_CkDecryptFile(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool;
function CkCrypt2_CkDecryptFileAsync(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask;
function CkCrypt2_CkEncryptFile(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool;
function CkCrypt2_CkEncryptFileAsync(objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask;
procedure CkCrypt2_ClearEncryptCerts(objHandle: HCkCrypt2);
procedure CkCrypt2_ClearSigningCerts(objHandle: HCkCrypt2);
function CkCrypt2_CompressBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_CompressBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__compressBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_CompressString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_CompressStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__compressStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_CrcBytes(objHandle: HCkCrypt2; crcAlg: PWideChar; byteData: HCkByteData): LongWord;
function CkCrypt2_CrcFile(objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): LongWord;
function CkCrypt2_CrcFileAsync(objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): HCkTask;
function CkCrypt2_CreateDetachedSignature(objHandle: HCkCrypt2; inFilePath: PWideChar; sigFilePath: PWideChar): wordbool;
function CkCrypt2_CreateP7M(objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): wordbool;
function CkCrypt2_CreateP7MAsync(objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): HCkTask;
function CkCrypt2_CreateP7S(objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): wordbool;
function CkCrypt2_CreateP7SAsync(objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): HCkTask;
function CkCrypt2_Decode(objHandle: HCkCrypt2; str: PWideChar; encoding: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_DecodeString(objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__decodeString(objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar): PWideChar;
function CkCrypt2_DecryptBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
function CkCrypt2_DecryptBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_DecryptBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_DecryptBytesENC(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_DecryptEncoded(objHandle: HCkCrypt2; encodedEncryptedData: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__decryptEncoded(objHandle: HCkCrypt2; encodedEncryptedData: PWideChar): PWideChar;
function CkCrypt2_DecryptSb(objHandle: HCkCrypt2; bdIn: HCkBinData; sbOut: HCkStringBuilder): wordbool;
function CkCrypt2_DecryptSecureENC(objHandle: HCkCrypt2; cipherText: PWideChar; secureStr: HCkSecureString): wordbool;
function CkCrypt2_DecryptStream(objHandle: HCkCrypt2; strm: HCkStream): wordbool;
function CkCrypt2_DecryptStreamAsync(objHandle: HCkCrypt2; strm: HCkStream): HCkTask;
function CkCrypt2_DecryptString(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__decryptString(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_DecryptStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__decryptStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_Encode(objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__encode(objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar): PWideChar;
function CkCrypt2_EncodeBytes(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__encodeBytes(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar): PWideChar;
function CkCrypt2_EncodeInt(objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__encodeInt(objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar): PWideChar;
function CkCrypt2_EncodeString(objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__encodeString(objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar): PWideChar;
function CkCrypt2_EncryptBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
function CkCrypt2_EncryptBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_EncryptBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_EncryptBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__encryptBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_EncryptEncoded(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__encryptEncoded(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_EncryptSb(objHandle: HCkCrypt2; sbIn: HCkStringBuilder; bdOut: HCkBinData): wordbool;
function CkCrypt2_EncryptSecureENC(objHandle: HCkCrypt2; secureStr: HCkSecureString; outStr: HCkString): wordbool;
function CkCrypt2__encryptSecureENC(objHandle: HCkCrypt2; secureStr: HCkSecureString): PWideChar;
function CkCrypt2_EncryptStream(objHandle: HCkCrypt2; strm: HCkStream): wordbool;
function CkCrypt2_EncryptStreamAsync(objHandle: HCkCrypt2; strm: HCkStream): HCkTask;
function CkCrypt2_EncryptString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_EncryptStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__encryptStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_GenEncodedSecretKey(objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__genEncodedSecretKey(objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar): PWideChar;
function CkCrypt2_GenerateSecretKey(objHandle: HCkCrypt2; password: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_GenerateUuid(objHandle: HCkCrypt2; outStr: HCkString): wordbool;
function CkCrypt2__generateUuid(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_GenRandomBytesENC(objHandle: HCkCrypt2; numBytes: Integer; outStr: HCkString): wordbool;
function CkCrypt2__genRandomBytesENC(objHandle: HCkCrypt2; numBytes: Integer): PWideChar;
function CkCrypt2_GetDecryptCert(objHandle: HCkCrypt2): HCkCert;
function CkCrypt2_GetEncodedAad(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__getEncodedAad(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
function CkCrypt2_GetEncodedAuthTag(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__getEncodedAuthTag(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
function CkCrypt2_GetEncodedIV(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__getEncodedIV(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
function CkCrypt2_GetEncodedKey(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__getEncodedKey(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
function CkCrypt2_GetEncodedSalt(objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__getEncodedSalt(objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
function CkCrypt2_GetLastCert(objHandle: HCkCrypt2): HCkCert;
function CkCrypt2_GetSignatureSigningTimeStr(objHandle: HCkCrypt2; index: Integer; outStr: HCkString): wordbool;
function CkCrypt2__getSignatureSigningTimeStr(objHandle: HCkCrypt2; index: Integer): PWideChar;
function CkCrypt2_GetSignedAttributes(objHandle: HCkCrypt2; signerIndex: Integer; pkcs7Der: HCkBinData; sbJson: HCkStringBuilder): wordbool;
function CkCrypt2_GetSignerCert(objHandle: HCkCrypt2; index: Integer): HCkCert;
function CkCrypt2_GetSignerCertChain(objHandle: HCkCrypt2; index: Integer): HCkCertChain;
function CkCrypt2_HashBdENC(objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool;
function CkCrypt2__hashBdENC(objHandle: HCkCrypt2; bd: HCkBinData): PWideChar;
function CkCrypt2_HashBeginBytes(objHandle: HCkCrypt2; data: HCkByteData): wordbool;
function CkCrypt2_HashBeginBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord): wordbool;
function CkCrypt2_HashBeginString(objHandle: HCkCrypt2; strData: PWideChar): wordbool;
function CkCrypt2_HashBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_HashBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_HashBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__hashBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_HashFile(objHandle: HCkCrypt2; path: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_HashFileAsync(objHandle: HCkCrypt2; path: PWideChar): HCkTask;
function CkCrypt2_HashFileENC(objHandle: HCkCrypt2; path: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__hashFileENC(objHandle: HCkCrypt2; path: PWideChar): PWideChar;
function CkCrypt2_HashFileENCAsync(objHandle: HCkCrypt2; path: PWideChar): HCkTask;
function CkCrypt2_HashFinal(objHandle: HCkCrypt2; outData: HCkByteData): wordbool;
function CkCrypt2_HashFinalENC(objHandle: HCkCrypt2; outStr: HCkString): wordbool;
function CkCrypt2__hashFinalENC(objHandle: HCkCrypt2): PWideChar;
function CkCrypt2_HashMoreBytes(objHandle: HCkCrypt2; data: HCkByteData): wordbool;
function CkCrypt2_HashMoreBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord): wordbool;
function CkCrypt2_HashMoreString(objHandle: HCkCrypt2; strData: PWideChar): wordbool;
function CkCrypt2_HashString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_HashStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__hashStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_HasSignatureSigningTime(objHandle: HCkCrypt2; index: Integer): wordbool;
function CkCrypt2_HmacBytes(objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_HmacBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__hmacBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar;
function CkCrypt2_HmacString(objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_HmacStringENC(objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__hmacStringENC(objHandle: HCkCrypt2; inText: PWideChar): PWideChar;
function CkCrypt2_Hotp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__hotp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar;
function CkCrypt2_InflateBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_InflateBytesENC(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_InflateString(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__inflateString(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_InflateStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__inflateStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_IsUnlocked(objHandle: HCkCrypt2): wordbool;
function CkCrypt2_LastJsonData(objHandle: HCkCrypt2): HCkJsonObject;
function CkCrypt2_LoadTaskCaller(objHandle: HCkCrypt2; task: HCkTask): wordbool;
function CkCrypt2_MacBdENC(objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool;
function CkCrypt2__macBdENC(objHandle: HCkCrypt2; bd: HCkBinData): PWideChar;
function CkCrypt2_MacBytes(objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_MacBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_MacBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__macBytesENC(objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar;
function CkCrypt2_MacString(objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_MacStringENC(objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__macStringENC(objHandle: HCkCrypt2; inText: PWideChar): PWideChar;
function CkCrypt2_MySqlAesDecrypt(objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__mySqlAesDecrypt(objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar): PWideChar;
function CkCrypt2_MySqlAesEncrypt(objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__mySqlAesEncrypt(objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar): PWideChar;
function CkCrypt2_OpaqueSignBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
function CkCrypt2_OpaqueSignBdAsync(objHandle: HCkCrypt2; bd: HCkBinData): HCkTask;
function CkCrypt2_OpaqueSignBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_OpaqueSignBytesAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
function CkCrypt2_OpaqueSignBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_OpaqueSignBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__opaqueSignBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_OpaqueSignBytesENCAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
function CkCrypt2_OpaqueSignString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_OpaqueSignStringAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask;
function CkCrypt2_OpaqueSignStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__opaqueSignStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_OpaqueSignStringENCAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask;
function CkCrypt2_OpaqueVerifyBd(objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
function CkCrypt2_OpaqueVerifyBytes(objHandle: HCkCrypt2; p7s: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_OpaqueVerifyBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_OpaqueVerifyBytesENC(objHandle: HCkCrypt2; p7s: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_OpaqueVerifyString(objHandle: HCkCrypt2; p7s: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__opaqueVerifyString(objHandle: HCkCrypt2; p7s: HCkByteData): PWideChar;
function CkCrypt2_OpaqueVerifyStringENC(objHandle: HCkCrypt2; p7s: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__opaqueVerifyStringENC(objHandle: HCkCrypt2; p7s: PWideChar): PWideChar;
function CkCrypt2_Pbkdf1(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__pbkdf1(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar;
function CkCrypt2_Pbkdf2(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__pbkdf2(objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar;
function CkCrypt2_Pkcs7ExtractDigest(objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__pkcs7ExtractDigest(objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar): PWideChar;
procedure CkCrypt2_RandomizeIV(objHandle: HCkCrypt2);
procedure CkCrypt2_RandomizeKey(objHandle: HCkCrypt2);
function CkCrypt2_ReadFile(objHandle: HCkCrypt2; filename: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_ReEncode(objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__reEncode(objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar): PWideChar;
function CkCrypt2_SaveLastError(objHandle: HCkCrypt2; path: PWideChar): wordbool;
function CkCrypt2_SetDecryptCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool;
function CkCrypt2_SetDecryptCert2(objHandle: HCkCrypt2; cert: HCkCert; key: HCkPrivateKey): wordbool;
function CkCrypt2_SetEncodedAad(objHandle: HCkCrypt2; aadStr: PWideChar; encoding: PWideChar): wordbool;
function CkCrypt2_SetEncodedAuthTag(objHandle: HCkCrypt2; authTagStr: PWideChar; encoding: PWideChar): wordbool;
procedure CkCrypt2_SetEncodedIV(objHandle: HCkCrypt2; ivStr: PWideChar; encoding: PWideChar);
procedure CkCrypt2_SetEncodedKey(objHandle: HCkCrypt2; keyStr: PWideChar; encoding: PWideChar);
procedure CkCrypt2_SetEncodedSalt(objHandle: HCkCrypt2; saltStr: PWideChar; encoding: PWideChar);
function CkCrypt2_SetEncryptCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool;
procedure CkCrypt2_SetHmacKeyBytes(objHandle: HCkCrypt2; keyBytes: HCkByteData);
procedure CkCrypt2_SetHmacKeyEncoded(objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar);
procedure CkCrypt2_SetHmacKeyString(objHandle: HCkCrypt2; key: PWideChar);
procedure CkCrypt2_SetIV(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord);
function CkCrypt2_SetMacKeyBytes(objHandle: HCkCrypt2; keyBytes: HCkByteData): wordbool;
function CkCrypt2_SetMacKeyEncoded(objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar): wordbool;
function CkCrypt2_SetMacKeyString(objHandle: HCkCrypt2; key: PWideChar): wordbool;
procedure CkCrypt2_SetSecretKey(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord);
procedure CkCrypt2_SetSecretKeyViaPassword(objHandle: HCkCrypt2; password: PWideChar);
function CkCrypt2_SetSigningCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool;
function CkCrypt2_SetSigningCert2(objHandle: HCkCrypt2; cert: HCkCert; privateKey: HCkPrivateKey): wordbool;
procedure CkCrypt2_SetTsaHttpObj(objHandle: HCkCrypt2; http: HCkHttp);
function CkCrypt2_SetVerifyCert(objHandle: HCkCrypt2; cert: HCkCert): wordbool;
function CkCrypt2_SignBdENC(objHandle: HCkCrypt2; dataToSign: HCkBinData; outStr: HCkString): wordbool;
function CkCrypt2__signBdENC(objHandle: HCkCrypt2; dataToSign: HCkBinData): PWideChar;
function CkCrypt2_SignBdENCAsync(objHandle: HCkCrypt2; dataToSign: HCkBinData): HCkTask;
function CkCrypt2_SignBytes(objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
function CkCrypt2_SignBytesAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
function CkCrypt2_SignBytes2(objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
function CkCrypt2_SignBytesENC(objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
function CkCrypt2__signBytesENC(objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
function CkCrypt2_SignBytesENCAsync(objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
function CkCrypt2_SignSbENC(objHandle: HCkCrypt2; sb: HCkStringBuilder; outStr: HCkString): wordbool;
function CkCrypt2__signSbENC(objHandle: HCkCrypt2; sb: HCkStringBuilder): PWideChar;
function CkCrypt2_SignSbENCAsync(objHandle: HCkCrypt2; sb: HCkStringBuilder): HCkTask;
function CkCrypt2_SignString(objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_SignStringAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask;
function CkCrypt2_SignStringENC(objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__signStringENC(objHandle: HCkCrypt2; str: PWideChar): PWideChar;
function CkCrypt2_SignStringENCAsync(objHandle: HCkCrypt2; str: PWideChar): HCkTask;
function CkCrypt2_StringToBytes(objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; outData: HCkByteData): wordbool;
function CkCrypt2_Totp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__totp(objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar;
function CkCrypt2_TrimEndingWith(objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar; outStr: HCkString): wordbool;
function CkCrypt2__trimEndingWith(objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar): PWideChar;
function CkCrypt2_UnlockComponent(objHandle: HCkCrypt2; unlockCode: PWideChar): wordbool;
function CkCrypt2_UseCertVault(objHandle: HCkCrypt2; vault: HCkXmlCertVault): wordbool;
function CkCrypt2_VerifyBdENC(objHandle: HCkCrypt2; data: HCkBinData; encodedSig: PWideChar): wordbool;
function CkCrypt2_VerifyBytes(objHandle: HCkCrypt2; data: HCkByteData; sig: HCkByteData): wordbool;
function CkCrypt2_VerifyBytesENC(objHandle: HCkCrypt2; data: HCkByteData; encodedSig: PWideChar): wordbool;
function CkCrypt2_VerifyDetachedSignature(objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool;
function CkCrypt2_VerifyP7M(objHandle: HCkCrypt2; p7mPath: PWideChar; destPath: PWideChar): wordbool;
function CkCrypt2_VerifyP7S(objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool;
function CkCrypt2_VerifySbENC(objHandle: HCkCrypt2; sb: HCkStringBuilder; encodedSig: PWideChar): wordbool;
function CkCrypt2_VerifyString(objHandle: HCkCrypt2; str: PWideChar; sig: HCkByteData): wordbool;
function CkCrypt2_VerifyStringENC(objHandle: HCkCrypt2; str: PWideChar; encodedSig: PWideChar): wordbool;
function CkCrypt2_WriteFile(objHandle: HCkCrypt2; filename: PWideChar; fileData: HCkByteData): wordbool;
implementation

uses windows, sysutils, ckDllLoader;

Type
  TCkCrypt2_Create = function : HCkCrypt2; stdcall;
  TCkCrypt2_Dispose = procedure (handle: HCkCrypt2); stdcall;
  TCkCrypt2_getAbortCurrent = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putAbortCurrent = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getBCryptWorkFactor = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putBCryptWorkFactor = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getBlockSize = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_getCadesEnabled = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putCadesEnabled = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getCadesSigPolicyHash = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCadesSigPolicyHash = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__cadesSigPolicyHash = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCadesSigPolicyId = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCadesSigPolicyId = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__cadesSigPolicyId = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCadesSigPolicyUri = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCadesSigPolicyUri = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__cadesSigPolicyUri = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCharset = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCharset = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__charset = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCipherMode = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCipherMode = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__cipherMode = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCmsOptions = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCmsOptions = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__cmsOptions = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCompressionAlgorithm = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCompressionAlgorithm = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__compressionAlgorithm = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getCryptAlgorithm = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putCryptAlgorithm = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__cryptAlgorithm = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getDebugLogFilePath = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putDebugLogFilePath = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__debugLogFilePath = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getEncodingMode = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putEncodingMode = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__encodingMode = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getFirstChunk = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putFirstChunk = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getHashAlgorithm = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putHashAlgorithm = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__hashAlgorithm = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getHavalRounds = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putHavalRounds = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getHeartbeatMs = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putHeartbeatMs = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getIncludeCertChain = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putIncludeCertChain = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getInitialCount = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putInitialCount = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getIterationCount = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putIterationCount = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getIV = procedure (objHandle: HCkCrypt2; outPropVal: HCkByteData); stdcall;
  TCkCrypt2_putIV = procedure (objHandle: HCkCrypt2; newPropVal: HCkByteData); stdcall;
  TCkCrypt2_getKeyLength = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putKeyLength = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getLastChunk = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putLastChunk = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getLastErrorHtml = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2__lastErrorHtml = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getLastErrorText = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2__lastErrorText = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getLastErrorXml = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2__lastErrorXml = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getLastMethodSuccess = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putLastMethodSuccess = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getMacAlgorithm = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putMacAlgorithm = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__macAlgorithm = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getNumSignerCerts = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_getOaepHash = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putOaepHash = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__oaepHash = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getOaepMgfHash = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putOaepMgfHash = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__oaepMgfHash = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getOaepPadding = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putOaepPadding = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getPaddingScheme = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putPaddingScheme = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getPbesAlgorithm = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putPbesAlgorithm = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__pbesAlgorithm = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getPbesPassword = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putPbesPassword = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__pbesPassword = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getPkcs7CryptAlg = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putPkcs7CryptAlg = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__pkcs7CryptAlg = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getRc2EffectiveKeyLength = function (objHandle: HCkCrypt2): Integer; stdcall;
  TCkCrypt2_putRc2EffectiveKeyLength = procedure (objHandle: HCkCrypt2; newPropVal: Integer); stdcall;
  TCkCrypt2_getSalt = procedure (objHandle: HCkCrypt2; outPropVal: HCkByteData); stdcall;
  TCkCrypt2_putSalt = procedure (objHandle: HCkCrypt2; newPropVal: HCkByteData); stdcall;
  TCkCrypt2_getSecretKey = procedure (objHandle: HCkCrypt2; outPropVal: HCkByteData); stdcall;
  TCkCrypt2_putSecretKey = procedure (objHandle: HCkCrypt2; newPropVal: HCkByteData); stdcall;
  TCkCrypt2_getSigningAlg = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putSigningAlg = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__signingAlg = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getSigningAttributes = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putSigningAttributes = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__signingAttributes = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getUncommonOptions = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putUncommonOptions = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__uncommonOptions = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getUuFilename = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putUuFilename = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__uuFilename = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getUuMode = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2_putUuMode = procedure (objHandle: HCkCrypt2; newPropVal: PWideChar); stdcall;
  TCkCrypt2__uuMode = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_getVerboseLogging = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_putVerboseLogging = procedure (objHandle: HCkCrypt2; newPropVal: wordbool); stdcall;
  TCkCrypt2_getVersion = procedure (objHandle: HCkCrypt2; outPropVal: HCkString); stdcall;
  TCkCrypt2__version = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_AddEncryptCert = procedure (objHandle: HCkCrypt2; cert: HCkCert); stdcall;
  TCkCrypt2_AddPfxSourceData = function (objHandle: HCkCrypt2; pfxBytes: HCkByteData; pfxPassword: PWideChar): wordbool; stdcall;
  TCkCrypt2_AddPfxSourceFile = function (objHandle: HCkCrypt2; pfxFilePath: PWideChar; pfxPassword: PWideChar): wordbool; stdcall;
  TCkCrypt2_AddSigningCert = function (objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;
  TCkCrypt2_AesKeyUnwrap = function (objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__aesKeyUnwrap = function (objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_AesKeyWrap = function (objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__aesKeyWrap = function (objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_BCryptHash = function (objHandle: HCkCrypt2; password: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__bCryptHash = function (objHandle: HCkCrypt2; password: PWideChar): PWideChar; stdcall;
  TCkCrypt2_BCryptVerify = function (objHandle: HCkCrypt2; password: PWideChar; bcryptHash: PWideChar): wordbool; stdcall;
  TCkCrypt2_BytesToString = function (objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__bytesToString = function (objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar): PWideChar; stdcall;
  TCkCrypt2_ByteSwap4321 = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_CkDecryptFile = function (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool; stdcall;
  TCkCrypt2_CkDecryptFileAsync = function (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask; stdcall;
  TCkCrypt2_CkEncryptFile = function (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool; stdcall;
  TCkCrypt2_CkEncryptFileAsync = function (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask; stdcall;
  TCkCrypt2_ClearEncryptCerts = procedure (objHandle: HCkCrypt2); stdcall;
  TCkCrypt2_ClearSigningCerts = procedure (objHandle: HCkCrypt2); stdcall;
  TCkCrypt2_CompressBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_CompressBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__compressBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_CompressString = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_CompressStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__compressStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_CrcBytes = function (objHandle: HCkCrypt2; crcAlg: PWideChar; byteData: HCkByteData): LongWord; stdcall;
  TCkCrypt2_CrcFile = function (objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): LongWord; stdcall;
  TCkCrypt2_CrcFileAsync = function (objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): HCkTask; stdcall;
  TCkCrypt2_CreateDetachedSignature = function (objHandle: HCkCrypt2; inFilePath: PWideChar; sigFilePath: PWideChar): wordbool; stdcall;
  TCkCrypt2_CreateP7M = function (objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): wordbool; stdcall;
  TCkCrypt2_CreateP7MAsync = function (objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): HCkTask; stdcall;
  TCkCrypt2_CreateP7S = function (objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): wordbool; stdcall;
  TCkCrypt2_CreateP7SAsync = function (objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): HCkTask; stdcall;
  TCkCrypt2_Decode = function (objHandle: HCkCrypt2; str: PWideChar; encoding: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_DecodeString = function (objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__decodeString = function (objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_DecryptBd = function (objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;
  TCkCrypt2_DecryptBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_DecryptBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_DecryptBytesENC = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_DecryptEncoded = function (objHandle: HCkCrypt2; encodedEncryptedData: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__decryptEncoded = function (objHandle: HCkCrypt2; encodedEncryptedData: PWideChar): PWideChar; stdcall;
  TCkCrypt2_DecryptSb = function (objHandle: HCkCrypt2; bdIn: HCkBinData; sbOut: HCkStringBuilder): wordbool; stdcall;
  TCkCrypt2_DecryptSecureENC = function (objHandle: HCkCrypt2; cipherText: PWideChar; secureStr: HCkSecureString): wordbool; stdcall;
  TCkCrypt2_DecryptStream = function (objHandle: HCkCrypt2; strm: HCkStream): wordbool; stdcall;
  TCkCrypt2_DecryptStreamAsync = function (objHandle: HCkCrypt2; strm: HCkStream): HCkTask; stdcall;
  TCkCrypt2_DecryptString = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__decryptString = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_DecryptStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__decryptStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_Encode = function (objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encode = function (objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_EncodeBytes = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encodeBytes = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_EncodeInt = function (objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encodeInt = function (objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_EncodeString = function (objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encodeString = function (objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar): PWideChar; stdcall;
  TCkCrypt2_EncryptBd = function (objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;
  TCkCrypt2_EncryptBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_EncryptBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_EncryptBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encryptBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_EncryptEncoded = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encryptEncoded = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_EncryptSb = function (objHandle: HCkCrypt2; sbIn: HCkStringBuilder; bdOut: HCkBinData): wordbool; stdcall;
  TCkCrypt2_EncryptSecureENC = function (objHandle: HCkCrypt2; secureStr: HCkSecureString; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encryptSecureENC = function (objHandle: HCkCrypt2; secureStr: HCkSecureString): PWideChar; stdcall;
  TCkCrypt2_EncryptStream = function (objHandle: HCkCrypt2; strm: HCkStream): wordbool; stdcall;
  TCkCrypt2_EncryptStreamAsync = function (objHandle: HCkCrypt2; strm: HCkStream): HCkTask; stdcall;
  TCkCrypt2_EncryptString = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_EncryptStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__encryptStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GenEncodedSecretKey = function (objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__genEncodedSecretKey = function (objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GenerateSecretKey = function (objHandle: HCkCrypt2; password: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_GenerateUuid = function (objHandle: HCkCrypt2; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__generateUuid = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_GenRandomBytesENC = function (objHandle: HCkCrypt2; numBytes: Integer; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__genRandomBytesENC = function (objHandle: HCkCrypt2; numBytes: Integer): PWideChar; stdcall;
  TCkCrypt2_GetDecryptCert = function (objHandle: HCkCrypt2): HCkCert; stdcall;
  TCkCrypt2_GetEncodedAad = function (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__getEncodedAad = function (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GetEncodedAuthTag = function (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__getEncodedAuthTag = function (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GetEncodedIV = function (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__getEncodedIV = function (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GetEncodedKey = function (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__getEncodedKey = function (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GetEncodedSalt = function (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__getEncodedSalt = function (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_GetLastCert = function (objHandle: HCkCrypt2): HCkCert; stdcall;
  TCkCrypt2_GetSignatureSigningTimeStr = function (objHandle: HCkCrypt2; index: Integer; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__getSignatureSigningTimeStr = function (objHandle: HCkCrypt2; index: Integer): PWideChar; stdcall;
  TCkCrypt2_GetSignedAttributes = function (objHandle: HCkCrypt2; signerIndex: Integer; pkcs7Der: HCkBinData; sbJson: HCkStringBuilder): wordbool; stdcall;
  TCkCrypt2_GetSignerCert = function (objHandle: HCkCrypt2; index: Integer): HCkCert; stdcall;
  TCkCrypt2_GetSignerCertChain = function (objHandle: HCkCrypt2; index: Integer): HCkCertChain; stdcall;
  TCkCrypt2_HashBdENC = function (objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hashBdENC = function (objHandle: HCkCrypt2; bd: HCkBinData): PWideChar; stdcall;
  TCkCrypt2_HashBeginBytes = function (objHandle: HCkCrypt2; data: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashBeginBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord): wordbool; stdcall;
  TCkCrypt2_HashBeginString = function (objHandle: HCkCrypt2; strData: PWideChar): wordbool; stdcall;
  TCkCrypt2_HashBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hashBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_HashFile = function (objHandle: HCkCrypt2; path: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashFileAsync = function (objHandle: HCkCrypt2; path: PWideChar): HCkTask; stdcall;
  TCkCrypt2_HashFileENC = function (objHandle: HCkCrypt2; path: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hashFileENC = function (objHandle: HCkCrypt2; path: PWideChar): PWideChar; stdcall;
  TCkCrypt2_HashFileENCAsync = function (objHandle: HCkCrypt2; path: PWideChar): HCkTask; stdcall;
  TCkCrypt2_HashFinal = function (objHandle: HCkCrypt2; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashFinalENC = function (objHandle: HCkCrypt2; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hashFinalENC = function (objHandle: HCkCrypt2): PWideChar; stdcall;
  TCkCrypt2_HashMoreBytes = function (objHandle: HCkCrypt2; data: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashMoreBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord): wordbool; stdcall;
  TCkCrypt2_HashMoreString = function (objHandle: HCkCrypt2; strData: PWideChar): wordbool; stdcall;
  TCkCrypt2_HashString = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HashStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hashStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_HasSignatureSigningTime = function (objHandle: HCkCrypt2; index: Integer): wordbool; stdcall;
  TCkCrypt2_HmacBytes = function (objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HmacBytesENC = function (objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hmacBytesENC = function (objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_HmacString = function (objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_HmacStringENC = function (objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hmacStringENC = function (objHandle: HCkCrypt2; inText: PWideChar): PWideChar; stdcall;
  TCkCrypt2_Hotp = function (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__hotp = function (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar; stdcall;
  TCkCrypt2_InflateBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_InflateBytesENC = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_InflateString = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__inflateString = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_InflateStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__inflateStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_IsUnlocked = function (objHandle: HCkCrypt2): wordbool; stdcall;
  TCkCrypt2_LastJsonData = function (objHandle: HCkCrypt2): HCkJsonObject; stdcall;
  TCkCrypt2_LoadTaskCaller = function (objHandle: HCkCrypt2; task: HCkTask): wordbool; stdcall;
  TCkCrypt2_MacBdENC = function (objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__macBdENC = function (objHandle: HCkCrypt2; bd: HCkBinData): PWideChar; stdcall;
  TCkCrypt2_MacBytes = function (objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_MacBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_MacBytesENC = function (objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__macBytesENC = function (objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_MacString = function (objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_MacStringENC = function (objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__macStringENC = function (objHandle: HCkCrypt2; inText: PWideChar): PWideChar; stdcall;
  TCkCrypt2_MySqlAesDecrypt = function (objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__mySqlAesDecrypt = function (objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar): PWideChar; stdcall;
  TCkCrypt2_MySqlAesEncrypt = function (objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__mySqlAesEncrypt = function (objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar): PWideChar; stdcall;
  TCkCrypt2_OpaqueSignBd = function (objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;
  TCkCrypt2_OpaqueSignBdAsync = function (objHandle: HCkCrypt2; bd: HCkBinData): HCkTask; stdcall;
  TCkCrypt2_OpaqueSignBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_OpaqueSignBytesAsync = function (objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;
  TCkCrypt2_OpaqueSignBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_OpaqueSignBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__opaqueSignBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_OpaqueSignBytesENCAsync = function (objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;
  TCkCrypt2_OpaqueSignString = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_OpaqueSignStringAsync = function (objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;
  TCkCrypt2_OpaqueSignStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__opaqueSignStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_OpaqueSignStringENCAsync = function (objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;
  TCkCrypt2_OpaqueVerifyBd = function (objHandle: HCkCrypt2; bd: HCkBinData): wordbool; stdcall;
  TCkCrypt2_OpaqueVerifyBytes = function (objHandle: HCkCrypt2; p7s: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_OpaqueVerifyBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_OpaqueVerifyBytesENC = function (objHandle: HCkCrypt2; p7s: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_OpaqueVerifyString = function (objHandle: HCkCrypt2; p7s: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__opaqueVerifyString = function (objHandle: HCkCrypt2; p7s: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_OpaqueVerifyStringENC = function (objHandle: HCkCrypt2; p7s: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__opaqueVerifyStringENC = function (objHandle: HCkCrypt2; p7s: PWideChar): PWideChar; stdcall;
  TCkCrypt2_Pbkdf1 = function (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__pbkdf1 = function (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_Pbkdf2 = function (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__pbkdf2 = function (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_Pkcs7ExtractDigest = function (objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__pkcs7ExtractDigest = function (objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar): PWideChar; stdcall;
  TCkCrypt2_RandomizeIV = procedure (objHandle: HCkCrypt2); stdcall;
  TCkCrypt2_RandomizeKey = procedure (objHandle: HCkCrypt2); stdcall;
  TCkCrypt2_ReadFile = function (objHandle: HCkCrypt2; filename: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_ReEncode = function (objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__reEncode = function (objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar): PWideChar; stdcall;
  TCkCrypt2_SaveLastError = function (objHandle: HCkCrypt2; path: PWideChar): wordbool; stdcall;
  TCkCrypt2_SetDecryptCert = function (objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;
  TCkCrypt2_SetDecryptCert2 = function (objHandle: HCkCrypt2; cert: HCkCert; key: HCkPrivateKey): wordbool; stdcall;
  TCkCrypt2_SetEncodedAad = function (objHandle: HCkCrypt2; aadStr: PWideChar; encoding: PWideChar): wordbool; stdcall;
  TCkCrypt2_SetEncodedAuthTag = function (objHandle: HCkCrypt2; authTagStr: PWideChar; encoding: PWideChar): wordbool; stdcall;
  TCkCrypt2_SetEncodedIV = procedure (objHandle: HCkCrypt2; ivStr: PWideChar; encoding: PWideChar); stdcall;
  TCkCrypt2_SetEncodedKey = procedure (objHandle: HCkCrypt2; keyStr: PWideChar; encoding: PWideChar); stdcall;
  TCkCrypt2_SetEncodedSalt = procedure (objHandle: HCkCrypt2; saltStr: PWideChar; encoding: PWideChar); stdcall;
  TCkCrypt2_SetEncryptCert = function (objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;
  TCkCrypt2_SetHmacKeyBytes = procedure (objHandle: HCkCrypt2; keyBytes: HCkByteData); stdcall;
  TCkCrypt2_SetHmacKeyEncoded = procedure (objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar); stdcall;
  TCkCrypt2_SetHmacKeyString = procedure (objHandle: HCkCrypt2; key: PWideChar); stdcall;
  TCkCrypt2_SetIV = procedure (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord); stdcall;
  TCkCrypt2_SetMacKeyBytes = function (objHandle: HCkCrypt2; keyBytes: HCkByteData): wordbool; stdcall;
  TCkCrypt2_SetMacKeyEncoded = function (objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar): wordbool; stdcall;
  TCkCrypt2_SetMacKeyString = function (objHandle: HCkCrypt2; key: PWideChar): wordbool; stdcall;
  TCkCrypt2_SetSecretKey = procedure (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord); stdcall;
  TCkCrypt2_SetSecretKeyViaPassword = procedure (objHandle: HCkCrypt2; password: PWideChar); stdcall;
  TCkCrypt2_SetSigningCert = function (objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;
  TCkCrypt2_SetSigningCert2 = function (objHandle: HCkCrypt2; cert: HCkCert; privateKey: HCkPrivateKey): wordbool; stdcall;
  TCkCrypt2_SetTsaHttpObj = procedure (objHandle: HCkCrypt2; http: HCkHttp); stdcall;
  TCkCrypt2_SetVerifyCert = function (objHandle: HCkCrypt2; cert: HCkCert): wordbool; stdcall;
  TCkCrypt2_SignBdENC = function (objHandle: HCkCrypt2; dataToSign: HCkBinData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__signBdENC = function (objHandle: HCkCrypt2; dataToSign: HCkBinData): PWideChar; stdcall;
  TCkCrypt2_SignBdENCAsync = function (objHandle: HCkCrypt2; dataToSign: HCkBinData): HCkTask; stdcall;
  TCkCrypt2_SignBytes = function (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_SignBytesAsync = function (objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;
  TCkCrypt2_SignBytes2 = function (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_SignBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__signBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData): PWideChar; stdcall;
  TCkCrypt2_SignBytesENCAsync = function (objHandle: HCkCrypt2; data: HCkByteData): HCkTask; stdcall;
  TCkCrypt2_SignSbENC = function (objHandle: HCkCrypt2; sb: HCkStringBuilder; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__signSbENC = function (objHandle: HCkCrypt2; sb: HCkStringBuilder): PWideChar; stdcall;
  TCkCrypt2_SignSbENCAsync = function (objHandle: HCkCrypt2; sb: HCkStringBuilder): HCkTask; stdcall;
  TCkCrypt2_SignString = function (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_SignStringAsync = function (objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;
  TCkCrypt2_SignStringENC = function (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__signStringENC = function (objHandle: HCkCrypt2; str: PWideChar): PWideChar; stdcall;
  TCkCrypt2_SignStringENCAsync = function (objHandle: HCkCrypt2; str: PWideChar): HCkTask; stdcall;
  TCkCrypt2_StringToBytes = function (objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; outData: HCkByteData): wordbool; stdcall;
  TCkCrypt2_Totp = function (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__totp = function (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar; stdcall;
  TCkCrypt2_TrimEndingWith = function (objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar; outStr: HCkString): wordbool; stdcall;
  TCkCrypt2__trimEndingWith = function (objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar): PWideChar; stdcall;
  TCkCrypt2_UnlockComponent = function (objHandle: HCkCrypt2; unlockCode: PWideChar): wordbool; stdcall;
  TCkCrypt2_UseCertVault = function (objHandle: HCkCrypt2; vault: HCkXmlCertVault): wordbool; stdcall;
  TCkCrypt2_VerifyBdENC = function (objHandle: HCkCrypt2; data: HCkBinData; encodedSig: PWideChar): wordbool; stdcall;
  TCkCrypt2_VerifyBytes = function (objHandle: HCkCrypt2; data: HCkByteData; sig: HCkByteData): wordbool; stdcall;
  TCkCrypt2_VerifyBytesENC = function (objHandle: HCkCrypt2; data: HCkByteData; encodedSig: PWideChar): wordbool; stdcall;
  TCkCrypt2_VerifyDetachedSignature = function (objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool; stdcall;
  TCkCrypt2_VerifyP7M = function (objHandle: HCkCrypt2; p7mPath: PWideChar; destPath: PWideChar): wordbool; stdcall;
  TCkCrypt2_VerifyP7S = function (objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool; stdcall;
  TCkCrypt2_VerifySbENC = function (objHandle: HCkCrypt2; sb: HCkStringBuilder; encodedSig: PWideChar): wordbool; stdcall;
  TCkCrypt2_VerifyString = function (objHandle: HCkCrypt2; str: PWideChar; sig: HCkByteData): wordbool; stdcall;
  TCkCrypt2_VerifyStringENC = function (objHandle: HCkCrypt2; str: PWideChar; encodedSig: PWideChar): wordbool; stdcall;
  TCkCrypt2_WriteFile = function (objHandle: HCkCrypt2; filename: PWideChar; fileData: HCkByteData): wordbool; stdcall;

var
  _fkt_ptr_arr:   array [0..355] of Pointer;

function _Map( k:Integer; n:String):Pointer;
begin
  Result:=  _fkt_ptr_arr[k];
  if Result = nil then begin
    Chilkat_GetProcedureAddress(Result, n);
    _fkt_ptr_arr[k]:=   Result;
  end;
end;


function CkCrypt2_Create : HCkCrypt2;
begin
  result := TCkCrypt2_Create(_map(0, 'CkCrypt2_Create'));
end;

procedure CkCrypt2_Dispose (handle: HCkCrypt2);
begin
  TCkCrypt2_Dispose(_map(1, 'CkCrypt2_Dispose'))
    (handle);
end;


function CkCrypt2_getAbortCurrent (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getAbortCurrent(_map(2, 'CkCrypt2_getAbortCurrent'))
    (objHandle);
end;

procedure CkCrypt2_putAbortCurrent (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putAbortCurrent(_map(3, 'CkCrypt2_putAbortCurrent'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getBCryptWorkFactor (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getBCryptWorkFactor(_map(4, 'CkCrypt2_getBCryptWorkFactor'))
    (objHandle);
end;

procedure CkCrypt2_putBCryptWorkFactor (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putBCryptWorkFactor(_map(5, 'CkCrypt2_putBCryptWorkFactor'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getBlockSize (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getBlockSize(_map(6, 'CkCrypt2_getBlockSize'))
    (objHandle);
end;

function CkCrypt2_getCadesEnabled (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getCadesEnabled(_map(7, 'CkCrypt2_getCadesEnabled'))
    (objHandle);
end;

procedure CkCrypt2_putCadesEnabled (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putCadesEnabled(_map(8, 'CkCrypt2_putCadesEnabled'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getCadesSigPolicyHash (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCadesSigPolicyHash(_map(9, 'CkCrypt2_getCadesSigPolicyHash'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCadesSigPolicyHash (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCadesSigPolicyHash(_map(10, 'CkCrypt2_putCadesSigPolicyHash'))
    (objHandle, newPropVal);
end;

function CkCrypt2__cadesSigPolicyHash (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__cadesSigPolicyHash(_map(11, 'CkCrypt2__cadesSigPolicyHash'))
    (objHandle);
end;

procedure CkCrypt2_getCadesSigPolicyId (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCadesSigPolicyId(_map(12, 'CkCrypt2_getCadesSigPolicyId'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCadesSigPolicyId (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCadesSigPolicyId(_map(13, 'CkCrypt2_putCadesSigPolicyId'))
    (objHandle, newPropVal);
end;

function CkCrypt2__cadesSigPolicyId (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__cadesSigPolicyId(_map(14, 'CkCrypt2__cadesSigPolicyId'))
    (objHandle);
end;

procedure CkCrypt2_getCadesSigPolicyUri (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCadesSigPolicyUri(_map(15, 'CkCrypt2_getCadesSigPolicyUri'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCadesSigPolicyUri (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCadesSigPolicyUri(_map(16, 'CkCrypt2_putCadesSigPolicyUri'))
    (objHandle, newPropVal);
end;

function CkCrypt2__cadesSigPolicyUri (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__cadesSigPolicyUri(_map(17, 'CkCrypt2__cadesSigPolicyUri'))
    (objHandle);
end;

procedure CkCrypt2_getCharset (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCharset(_map(18, 'CkCrypt2_getCharset'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCharset (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCharset(_map(19, 'CkCrypt2_putCharset'))
    (objHandle, newPropVal);
end;

function CkCrypt2__charset (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__charset(_map(20, 'CkCrypt2__charset'))
    (objHandle);
end;

procedure CkCrypt2_getCipherMode (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCipherMode(_map(21, 'CkCrypt2_getCipherMode'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCipherMode (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCipherMode(_map(22, 'CkCrypt2_putCipherMode'))
    (objHandle, newPropVal);
end;

function CkCrypt2__cipherMode (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__cipherMode(_map(23, 'CkCrypt2__cipherMode'))
    (objHandle);
end;

procedure CkCrypt2_getCmsOptions (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCmsOptions(_map(24, 'CkCrypt2_getCmsOptions'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCmsOptions (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCmsOptions(_map(25, 'CkCrypt2_putCmsOptions'))
    (objHandle, newPropVal);
end;

function CkCrypt2__cmsOptions (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__cmsOptions(_map(26, 'CkCrypt2__cmsOptions'))
    (objHandle);
end;

procedure CkCrypt2_getCompressionAlgorithm (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCompressionAlgorithm(_map(27, 'CkCrypt2_getCompressionAlgorithm'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCompressionAlgorithm (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCompressionAlgorithm(_map(28, 'CkCrypt2_putCompressionAlgorithm'))
    (objHandle, newPropVal);
end;

function CkCrypt2__compressionAlgorithm (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__compressionAlgorithm(_map(29, 'CkCrypt2__compressionAlgorithm'))
    (objHandle);
end;

procedure CkCrypt2_getCryptAlgorithm (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getCryptAlgorithm(_map(30, 'CkCrypt2_getCryptAlgorithm'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putCryptAlgorithm (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putCryptAlgorithm(_map(31, 'CkCrypt2_putCryptAlgorithm'))
    (objHandle, newPropVal);
end;

function CkCrypt2__cryptAlgorithm (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__cryptAlgorithm(_map(32, 'CkCrypt2__cryptAlgorithm'))
    (objHandle);
end;

procedure CkCrypt2_getDebugLogFilePath (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getDebugLogFilePath(_map(33, 'CkCrypt2_getDebugLogFilePath'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putDebugLogFilePath (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putDebugLogFilePath(_map(34, 'CkCrypt2_putDebugLogFilePath'))
    (objHandle, newPropVal);
end;

function CkCrypt2__debugLogFilePath (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__debugLogFilePath(_map(35, 'CkCrypt2__debugLogFilePath'))
    (objHandle);
end;

procedure CkCrypt2_getEncodingMode (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getEncodingMode(_map(36, 'CkCrypt2_getEncodingMode'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putEncodingMode (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putEncodingMode(_map(37, 'CkCrypt2_putEncodingMode'))
    (objHandle, newPropVal);
end;

function CkCrypt2__encodingMode (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__encodingMode(_map(38, 'CkCrypt2__encodingMode'))
    (objHandle);
end;

function CkCrypt2_getFirstChunk (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getFirstChunk(_map(39, 'CkCrypt2_getFirstChunk'))
    (objHandle);
end;

procedure CkCrypt2_putFirstChunk (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putFirstChunk(_map(40, 'CkCrypt2_putFirstChunk'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getHashAlgorithm (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getHashAlgorithm(_map(41, 'CkCrypt2_getHashAlgorithm'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putHashAlgorithm (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putHashAlgorithm(_map(42, 'CkCrypt2_putHashAlgorithm'))
    (objHandle, newPropVal);
end;

function CkCrypt2__hashAlgorithm (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__hashAlgorithm(_map(43, 'CkCrypt2__hashAlgorithm'))
    (objHandle);
end;

function CkCrypt2_getHavalRounds (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getHavalRounds(_map(44, 'CkCrypt2_getHavalRounds'))
    (objHandle);
end;

procedure CkCrypt2_putHavalRounds (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putHavalRounds(_map(45, 'CkCrypt2_putHavalRounds'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getHeartbeatMs (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getHeartbeatMs(_map(46, 'CkCrypt2_getHeartbeatMs'))
    (objHandle);
end;

procedure CkCrypt2_putHeartbeatMs (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putHeartbeatMs(_map(47, 'CkCrypt2_putHeartbeatMs'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getIncludeCertChain (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getIncludeCertChain(_map(48, 'CkCrypt2_getIncludeCertChain'))
    (objHandle);
end;

procedure CkCrypt2_putIncludeCertChain (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putIncludeCertChain(_map(49, 'CkCrypt2_putIncludeCertChain'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getInitialCount (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getInitialCount(_map(50, 'CkCrypt2_getInitialCount'))
    (objHandle);
end;

procedure CkCrypt2_putInitialCount (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putInitialCount(_map(51, 'CkCrypt2_putInitialCount'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getIterationCount (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getIterationCount(_map(52, 'CkCrypt2_getIterationCount'))
    (objHandle);
end;

procedure CkCrypt2_putIterationCount (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putIterationCount(_map(53, 'CkCrypt2_putIterationCount'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getIV (objHandle: HCkCrypt2; outPropVal: HCkByteData);
begin
  TCkCrypt2_getIV(_map(54, 'CkCrypt2_getIV'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putIV (objHandle: HCkCrypt2; newPropVal: HCkByteData);
begin
  TCkCrypt2_putIV(_map(55, 'CkCrypt2_putIV'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getKeyLength (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getKeyLength(_map(56, 'CkCrypt2_getKeyLength'))
    (objHandle);
end;

procedure CkCrypt2_putKeyLength (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putKeyLength(_map(57, 'CkCrypt2_putKeyLength'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getLastChunk (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getLastChunk(_map(58, 'CkCrypt2_getLastChunk'))
    (objHandle);
end;

procedure CkCrypt2_putLastChunk (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putLastChunk(_map(59, 'CkCrypt2_putLastChunk'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getLastErrorHtml (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getLastErrorHtml(_map(60, 'CkCrypt2_getLastErrorHtml'))
    (objHandle, outPropVal);
end;

function CkCrypt2__lastErrorHtml (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__lastErrorHtml(_map(61, 'CkCrypt2__lastErrorHtml'))
    (objHandle);
end;

procedure CkCrypt2_getLastErrorText (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getLastErrorText(_map(62, 'CkCrypt2_getLastErrorText'))
    (objHandle, outPropVal);
end;

function CkCrypt2__lastErrorText (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__lastErrorText(_map(63, 'CkCrypt2__lastErrorText'))
    (objHandle);
end;

procedure CkCrypt2_getLastErrorXml (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getLastErrorXml(_map(64, 'CkCrypt2_getLastErrorXml'))
    (objHandle, outPropVal);
end;

function CkCrypt2__lastErrorXml (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__lastErrorXml(_map(65, 'CkCrypt2__lastErrorXml'))
    (objHandle);
end;

function CkCrypt2_getLastMethodSuccess (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getLastMethodSuccess(_map(66, 'CkCrypt2_getLastMethodSuccess'))
    (objHandle);
end;

procedure CkCrypt2_putLastMethodSuccess (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putLastMethodSuccess(_map(67, 'CkCrypt2_putLastMethodSuccess'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getMacAlgorithm (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getMacAlgorithm(_map(68, 'CkCrypt2_getMacAlgorithm'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putMacAlgorithm (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putMacAlgorithm(_map(69, 'CkCrypt2_putMacAlgorithm'))
    (objHandle, newPropVal);
end;

function CkCrypt2__macAlgorithm (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__macAlgorithm(_map(70, 'CkCrypt2__macAlgorithm'))
    (objHandle);
end;

function CkCrypt2_getNumSignerCerts (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getNumSignerCerts(_map(71, 'CkCrypt2_getNumSignerCerts'))
    (objHandle);
end;

procedure CkCrypt2_getOaepHash (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getOaepHash(_map(72, 'CkCrypt2_getOaepHash'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putOaepHash (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putOaepHash(_map(73, 'CkCrypt2_putOaepHash'))
    (objHandle, newPropVal);
end;

function CkCrypt2__oaepHash (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__oaepHash(_map(74, 'CkCrypt2__oaepHash'))
    (objHandle);
end;

procedure CkCrypt2_getOaepMgfHash (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getOaepMgfHash(_map(75, 'CkCrypt2_getOaepMgfHash'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putOaepMgfHash (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putOaepMgfHash(_map(76, 'CkCrypt2_putOaepMgfHash'))
    (objHandle, newPropVal);
end;

function CkCrypt2__oaepMgfHash (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__oaepMgfHash(_map(77, 'CkCrypt2__oaepMgfHash'))
    (objHandle);
end;

function CkCrypt2_getOaepPadding (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getOaepPadding(_map(78, 'CkCrypt2_getOaepPadding'))
    (objHandle);
end;

procedure CkCrypt2_putOaepPadding (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putOaepPadding(_map(79, 'CkCrypt2_putOaepPadding'))
    (objHandle, newPropVal);
end;

function CkCrypt2_getPaddingScheme (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getPaddingScheme(_map(80, 'CkCrypt2_getPaddingScheme'))
    (objHandle);
end;

procedure CkCrypt2_putPaddingScheme (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putPaddingScheme(_map(81, 'CkCrypt2_putPaddingScheme'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getPbesAlgorithm (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getPbesAlgorithm(_map(82, 'CkCrypt2_getPbesAlgorithm'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putPbesAlgorithm (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putPbesAlgorithm(_map(83, 'CkCrypt2_putPbesAlgorithm'))
    (objHandle, newPropVal);
end;

function CkCrypt2__pbesAlgorithm (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__pbesAlgorithm(_map(84, 'CkCrypt2__pbesAlgorithm'))
    (objHandle);
end;

procedure CkCrypt2_getPbesPassword (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getPbesPassword(_map(85, 'CkCrypt2_getPbesPassword'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putPbesPassword (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putPbesPassword(_map(86, 'CkCrypt2_putPbesPassword'))
    (objHandle, newPropVal);
end;

function CkCrypt2__pbesPassword (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__pbesPassword(_map(87, 'CkCrypt2__pbesPassword'))
    (objHandle);
end;

procedure CkCrypt2_getPkcs7CryptAlg (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getPkcs7CryptAlg(_map(88, 'CkCrypt2_getPkcs7CryptAlg'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putPkcs7CryptAlg (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putPkcs7CryptAlg(_map(89, 'CkCrypt2_putPkcs7CryptAlg'))
    (objHandle, newPropVal);
end;

function CkCrypt2__pkcs7CryptAlg (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__pkcs7CryptAlg(_map(90, 'CkCrypt2__pkcs7CryptAlg'))
    (objHandle);
end;

function CkCrypt2_getRc2EffectiveKeyLength (objHandle: HCkCrypt2): Integer;
begin
    result := TCkCrypt2_getRc2EffectiveKeyLength(_map(91, 'CkCrypt2_getRc2EffectiveKeyLength'))
    (objHandle);
end;

procedure CkCrypt2_putRc2EffectiveKeyLength (objHandle: HCkCrypt2; newPropVal: Integer);
begin
  TCkCrypt2_putRc2EffectiveKeyLength(_map(92, 'CkCrypt2_putRc2EffectiveKeyLength'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getSalt (objHandle: HCkCrypt2; outPropVal: HCkByteData);
begin
  TCkCrypt2_getSalt(_map(93, 'CkCrypt2_getSalt'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putSalt (objHandle: HCkCrypt2; newPropVal: HCkByteData);
begin
  TCkCrypt2_putSalt(_map(94, 'CkCrypt2_putSalt'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getSecretKey (objHandle: HCkCrypt2; outPropVal: HCkByteData);
begin
  TCkCrypt2_getSecretKey(_map(95, 'CkCrypt2_getSecretKey'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putSecretKey (objHandle: HCkCrypt2; newPropVal: HCkByteData);
begin
  TCkCrypt2_putSecretKey(_map(96, 'CkCrypt2_putSecretKey'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getSigningAlg (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getSigningAlg(_map(97, 'CkCrypt2_getSigningAlg'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putSigningAlg (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putSigningAlg(_map(98, 'CkCrypt2_putSigningAlg'))
    (objHandle, newPropVal);
end;

function CkCrypt2__signingAlg (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__signingAlg(_map(99, 'CkCrypt2__signingAlg'))
    (objHandle);
end;

procedure CkCrypt2_getSigningAttributes (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getSigningAttributes(_map(100, 'CkCrypt2_getSigningAttributes'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putSigningAttributes (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putSigningAttributes(_map(101, 'CkCrypt2_putSigningAttributes'))
    (objHandle, newPropVal);
end;

function CkCrypt2__signingAttributes (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__signingAttributes(_map(102, 'CkCrypt2__signingAttributes'))
    (objHandle);
end;

procedure CkCrypt2_getUncommonOptions (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getUncommonOptions(_map(103, 'CkCrypt2_getUncommonOptions'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putUncommonOptions (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putUncommonOptions(_map(104, 'CkCrypt2_putUncommonOptions'))
    (objHandle, newPropVal);
end;

function CkCrypt2__uncommonOptions (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__uncommonOptions(_map(105, 'CkCrypt2__uncommonOptions'))
    (objHandle);
end;

procedure CkCrypt2_getUuFilename (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getUuFilename(_map(106, 'CkCrypt2_getUuFilename'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putUuFilename (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putUuFilename(_map(107, 'CkCrypt2_putUuFilename'))
    (objHandle, newPropVal);
end;

function CkCrypt2__uuFilename (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__uuFilename(_map(108, 'CkCrypt2__uuFilename'))
    (objHandle);
end;

procedure CkCrypt2_getUuMode (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getUuMode(_map(109, 'CkCrypt2_getUuMode'))
    (objHandle, outPropVal);
end;

procedure CkCrypt2_putUuMode (objHandle: HCkCrypt2; newPropVal: PWideChar);
begin
  TCkCrypt2_putUuMode(_map(110, 'CkCrypt2_putUuMode'))
    (objHandle, newPropVal);
end;

function CkCrypt2__uuMode (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__uuMode(_map(111, 'CkCrypt2__uuMode'))
    (objHandle);
end;

function CkCrypt2_getVerboseLogging (objHandle: HCkCrypt2): wordbool;
begin
    result := TCkCrypt2_getVerboseLogging(_map(112, 'CkCrypt2_getVerboseLogging'))
    (objHandle);
end;

procedure CkCrypt2_putVerboseLogging (objHandle: HCkCrypt2; newPropVal: wordbool);
begin
  TCkCrypt2_putVerboseLogging(_map(113, 'CkCrypt2_putVerboseLogging'))
    (objHandle, newPropVal);
end;

procedure CkCrypt2_getVersion (objHandle: HCkCrypt2; outPropVal: HCkString);
begin
  TCkCrypt2_getVersion(_map(114, 'CkCrypt2_getVersion'))
    (objHandle, outPropVal);
end;

function CkCrypt2__version (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__version(_map(115, 'CkCrypt2__version'))
    (objHandle);
end;

procedure CkCrypt2_AddEncryptCert (objHandle: HCkCrypt2; cert: HCkCert);
begin
  TCkCrypt2_AddEncryptCert(_map(116, 'CkCrypt2_AddEncryptCert'))
    (objHandle, cert);
end;

function CkCrypt2_AddPfxSourceData (objHandle: HCkCrypt2; pfxBytes: HCkByteData; pfxPassword: PWideChar): wordbool;
begin
  result := TCkCrypt2_AddPfxSourceData(_map(117, 'CkCrypt2_AddPfxSourceData'))
    (objHandle, pfxBytes, pfxPassword);
end;

function CkCrypt2_AddPfxSourceFile (objHandle: HCkCrypt2; pfxFilePath: PWideChar; pfxPassword: PWideChar): wordbool;
begin
  result := TCkCrypt2_AddPfxSourceFile(_map(118, 'CkCrypt2_AddPfxSourceFile'))
    (objHandle, pfxFilePath, pfxPassword);
end;

function CkCrypt2_AddSigningCert (objHandle: HCkCrypt2; cert: HCkCert): wordbool;
begin
  result := TCkCrypt2_AddSigningCert(_map(119, 'CkCrypt2_AddSigningCert'))
    (objHandle, cert);
end;

function CkCrypt2_AesKeyUnwrap (objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_AesKeyUnwrap(_map(120, 'CkCrypt2_AesKeyUnwrap'))
    (objHandle, kek, wrappedKeyData, encoding, outStr);
end;

function CkCrypt2__aesKeyUnwrap (objHandle: HCkCrypt2; kek: PWideChar; wrappedKeyData: PWideChar; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__aesKeyUnwrap(_map(121, 'CkCrypt2__aesKeyUnwrap'))
    (objHandle, kek, wrappedKeyData, encoding);
end;

function CkCrypt2_AesKeyWrap (objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_AesKeyWrap(_map(122, 'CkCrypt2_AesKeyWrap'))
    (objHandle, kek, keyData, encoding, outStr);
end;

function CkCrypt2__aesKeyWrap (objHandle: HCkCrypt2; kek: PWideChar; keyData: PWideChar; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__aesKeyWrap(_map(123, 'CkCrypt2__aesKeyWrap'))
    (objHandle, kek, keyData, encoding);
end;

function CkCrypt2_BCryptHash (objHandle: HCkCrypt2; password: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_BCryptHash(_map(124, 'CkCrypt2_BCryptHash'))
    (objHandle, password, outStr);
end;

function CkCrypt2__bCryptHash (objHandle: HCkCrypt2; password: PWideChar): PWideChar;
begin
  result := TCkCrypt2__bCryptHash(_map(125, 'CkCrypt2__bCryptHash'))
    (objHandle, password);
end;

function CkCrypt2_BCryptVerify (objHandle: HCkCrypt2; password: PWideChar; bcryptHash: PWideChar): wordbool;
begin
  result := TCkCrypt2_BCryptVerify(_map(126, 'CkCrypt2_BCryptVerify'))
    (objHandle, password, bcryptHash);
end;

function CkCrypt2_BytesToString (objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_BytesToString(_map(127, 'CkCrypt2_BytesToString'))
    (objHandle, inData, charset, outStr);
end;

function CkCrypt2__bytesToString (objHandle: HCkCrypt2; inData: HCkByteData; charset: PWideChar): PWideChar;
begin
  result := TCkCrypt2__bytesToString(_map(128, 'CkCrypt2__bytesToString'))
    (objHandle, inData, charset);
end;

function CkCrypt2_ByteSwap4321 (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_ByteSwap4321(_map(129, 'CkCrypt2_ByteSwap4321'))
    (objHandle, data, outData);
end;

function CkCrypt2_CkDecryptFile (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool;
begin
  result := TCkCrypt2_CkDecryptFile(_map(130, 'CkCrypt2_CkDecryptFile'))
    (objHandle, srcFile, destFile);
end;

function CkCrypt2_CkDecryptFileAsync (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask;
begin
  result := TCkCrypt2_CkDecryptFileAsync(_map(131, 'CkCrypt2_CkDecryptFileAsync'))
    (objHandle, srcFile, destFile);
end;

function CkCrypt2_CkEncryptFile (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): wordbool;
begin
  result := TCkCrypt2_CkEncryptFile(_map(132, 'CkCrypt2_CkEncryptFile'))
    (objHandle, srcFile, destFile);
end;

function CkCrypt2_CkEncryptFileAsync (objHandle: HCkCrypt2; srcFile: PWideChar; destFile: PWideChar): HCkTask;
begin
  result := TCkCrypt2_CkEncryptFileAsync(_map(133, 'CkCrypt2_CkEncryptFileAsync'))
    (objHandle, srcFile, destFile);
end;

procedure CkCrypt2_ClearEncryptCerts (objHandle: HCkCrypt2);
begin
  TCkCrypt2_ClearEncryptCerts(_map(134, 'CkCrypt2_ClearEncryptCerts'))
    (objHandle);
end;

procedure CkCrypt2_ClearSigningCerts (objHandle: HCkCrypt2);
begin
  TCkCrypt2_ClearSigningCerts(_map(135, 'CkCrypt2_ClearSigningCerts'))
    (objHandle);
end;

function CkCrypt2_CompressBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_CompressBytes(_map(136, 'CkCrypt2_CompressBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_CompressBytesENC (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_CompressBytesENC(_map(137, 'CkCrypt2_CompressBytesENC'))
    (objHandle, data, outStr);
end;

function CkCrypt2__compressBytesENC (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__compressBytesENC(_map(138, 'CkCrypt2__compressBytesENC'))
    (objHandle, data);
end;

function CkCrypt2_CompressString (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_CompressString(_map(139, 'CkCrypt2_CompressString'))
    (objHandle, str, outData);
end;

function CkCrypt2_CompressStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_CompressStringENC(_map(140, 'CkCrypt2_CompressStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__compressStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__compressStringENC(_map(141, 'CkCrypt2__compressStringENC'))
    (objHandle, str);
end;

function CkCrypt2_CrcBytes (objHandle: HCkCrypt2; crcAlg: PWideChar; byteData: HCkByteData): LongWord;
begin
  result := TCkCrypt2_CrcBytes(_map(142, 'CkCrypt2_CrcBytes'))
    (objHandle, crcAlg, byteData);
end;

function CkCrypt2_CrcFile (objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): LongWord;
begin
  result := TCkCrypt2_CrcFile(_map(143, 'CkCrypt2_CrcFile'))
    (objHandle, crcAlg, path);
end;

function CkCrypt2_CrcFileAsync (objHandle: HCkCrypt2; crcAlg: PWideChar; path: PWideChar): HCkTask;
begin
  result := TCkCrypt2_CrcFileAsync(_map(144, 'CkCrypt2_CrcFileAsync'))
    (objHandle, crcAlg, path);
end;

function CkCrypt2_CreateDetachedSignature (objHandle: HCkCrypt2; inFilePath: PWideChar; sigFilePath: PWideChar): wordbool;
begin
  result := TCkCrypt2_CreateDetachedSignature(_map(145, 'CkCrypt2_CreateDetachedSignature'))
    (objHandle, inFilePath, sigFilePath);
end;

function CkCrypt2_CreateP7M (objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): wordbool;
begin
  result := TCkCrypt2_CreateP7M(_map(146, 'CkCrypt2_CreateP7M'))
    (objHandle, inFilename, p7mPath);
end;

function CkCrypt2_CreateP7MAsync (objHandle: HCkCrypt2; inFilename: PWideChar; p7mPath: PWideChar): HCkTask;
begin
  result := TCkCrypt2_CreateP7MAsync(_map(147, 'CkCrypt2_CreateP7MAsync'))
    (objHandle, inFilename, p7mPath);
end;

function CkCrypt2_CreateP7S (objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): wordbool;
begin
  result := TCkCrypt2_CreateP7S(_map(148, 'CkCrypt2_CreateP7S'))
    (objHandle, inFilename, p7sPath);
end;

function CkCrypt2_CreateP7SAsync (objHandle: HCkCrypt2; inFilename: PWideChar; p7sPath: PWideChar): HCkTask;
begin
  result := TCkCrypt2_CreateP7SAsync(_map(149, 'CkCrypt2_CreateP7SAsync'))
    (objHandle, inFilename, p7sPath);
end;

function CkCrypt2_Decode (objHandle: HCkCrypt2; str: PWideChar; encoding: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_Decode(_map(150, 'CkCrypt2_Decode'))
    (objHandle, str, encoding, outData);
end;

function CkCrypt2_DecodeString (objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_DecodeString(_map(151, 'CkCrypt2_DecodeString'))
    (objHandle, inStr, charset, encoding, outStr);
end;

function CkCrypt2__decodeString (objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__decodeString(_map(152, 'CkCrypt2__decodeString'))
    (objHandle, inStr, charset, encoding);
end;

function CkCrypt2_DecryptBd (objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
begin
  result := TCkCrypt2_DecryptBd(_map(153, 'CkCrypt2_DecryptBd'))
    (objHandle, bd);
end;

function CkCrypt2_DecryptBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_DecryptBytes(_map(154, 'CkCrypt2_DecryptBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_DecryptBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_DecryptBytes2(_map(155, 'CkCrypt2_DecryptBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_DecryptBytesENC (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_DecryptBytesENC(_map(156, 'CkCrypt2_DecryptBytesENC'))
    (objHandle, str, outData);
end;

function CkCrypt2_DecryptEncoded (objHandle: HCkCrypt2; encodedEncryptedData: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_DecryptEncoded(_map(157, 'CkCrypt2_DecryptEncoded'))
    (objHandle, encodedEncryptedData, outStr);
end;

function CkCrypt2__decryptEncoded (objHandle: HCkCrypt2; encodedEncryptedData: PWideChar): PWideChar;
begin
  result := TCkCrypt2__decryptEncoded(_map(158, 'CkCrypt2__decryptEncoded'))
    (objHandle, encodedEncryptedData);
end;

function CkCrypt2_DecryptSb (objHandle: HCkCrypt2; bdIn: HCkBinData; sbOut: HCkStringBuilder): wordbool;
begin
  result := TCkCrypt2_DecryptSb(_map(159, 'CkCrypt2_DecryptSb'))
    (objHandle, bdIn, sbOut);
end;

function CkCrypt2_DecryptSecureENC (objHandle: HCkCrypt2; cipherText: PWideChar; secureStr: HCkSecureString): wordbool;
begin
  result := TCkCrypt2_DecryptSecureENC(_map(160, 'CkCrypt2_DecryptSecureENC'))
    (objHandle, cipherText, secureStr);
end;

function CkCrypt2_DecryptStream (objHandle: HCkCrypt2; strm: HCkStream): wordbool;
begin
  result := TCkCrypt2_DecryptStream(_map(161, 'CkCrypt2_DecryptStream'))
    (objHandle, strm);
end;

function CkCrypt2_DecryptStreamAsync (objHandle: HCkCrypt2; strm: HCkStream): HCkTask;
begin
  result := TCkCrypt2_DecryptStreamAsync(_map(162, 'CkCrypt2_DecryptStreamAsync'))
    (objHandle, strm);
end;

function CkCrypt2_DecryptString (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_DecryptString(_map(163, 'CkCrypt2_DecryptString'))
    (objHandle, data, outStr);
end;

function CkCrypt2__decryptString (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__decryptString(_map(164, 'CkCrypt2__decryptString'))
    (objHandle, data);
end;

function CkCrypt2_DecryptStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_DecryptStringENC(_map(165, 'CkCrypt2_DecryptStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__decryptStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__decryptStringENC(_map(166, 'CkCrypt2__decryptStringENC'))
    (objHandle, str);
end;

function CkCrypt2_Encode (objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_Encode(_map(167, 'CkCrypt2_Encode'))
    (objHandle, byteData, encoding, outStr);
end;

function CkCrypt2__encode (objHandle: HCkCrypt2; byteData: HCkByteData; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__encode(_map(168, 'CkCrypt2__encode'))
    (objHandle, byteData, encoding);
end;

function CkCrypt2_EncodeBytes (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncodeBytes(_map(169, 'CkCrypt2_EncodeBytes'))
    (objHandle, pByteData, szByteData, encoding, outStr);
end;

function CkCrypt2__encodeBytes (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__encodeBytes(_map(170, 'CkCrypt2__encodeBytes'))
    (objHandle, pByteData, szByteData, encoding);
end;

function CkCrypt2_EncodeInt (objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncodeInt(_map(171, 'CkCrypt2_EncodeInt'))
    (objHandle, value, numBytes, littleEndian, encoding, outStr);
end;

function CkCrypt2__encodeInt (objHandle: HCkCrypt2; value: Integer; numBytes: Integer; littleEndian: wordbool; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__encodeInt(_map(172, 'CkCrypt2__encodeInt'))
    (objHandle, value, numBytes, littleEndian, encoding);
end;

function CkCrypt2_EncodeString (objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncodeString(_map(173, 'CkCrypt2_EncodeString'))
    (objHandle, strToEncode, charsetName, toEncodingName, outStr);
end;

function CkCrypt2__encodeString (objHandle: HCkCrypt2; strToEncode: PWideChar; charsetName: PWideChar; toEncodingName: PWideChar): PWideChar;
begin
  result := TCkCrypt2__encodeString(_map(174, 'CkCrypt2__encodeString'))
    (objHandle, strToEncode, charsetName, toEncodingName);
end;

function CkCrypt2_EncryptBd (objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
begin
  result := TCkCrypt2_EncryptBd(_map(175, 'CkCrypt2_EncryptBd'))
    (objHandle, bd);
end;

function CkCrypt2_EncryptBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_EncryptBytes(_map(176, 'CkCrypt2_EncryptBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_EncryptBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_EncryptBytes2(_map(177, 'CkCrypt2_EncryptBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_EncryptBytesENC (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncryptBytesENC(_map(178, 'CkCrypt2_EncryptBytesENC'))
    (objHandle, data, outStr);
end;

function CkCrypt2__encryptBytesENC (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__encryptBytesENC(_map(179, 'CkCrypt2__encryptBytesENC'))
    (objHandle, data);
end;

function CkCrypt2_EncryptEncoded (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncryptEncoded(_map(180, 'CkCrypt2_EncryptEncoded'))
    (objHandle, str, outStr);
end;

function CkCrypt2__encryptEncoded (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__encryptEncoded(_map(181, 'CkCrypt2__encryptEncoded'))
    (objHandle, str);
end;

function CkCrypt2_EncryptSb (objHandle: HCkCrypt2; sbIn: HCkStringBuilder; bdOut: HCkBinData): wordbool;
begin
  result := TCkCrypt2_EncryptSb(_map(182, 'CkCrypt2_EncryptSb'))
    (objHandle, sbIn, bdOut);
end;

function CkCrypt2_EncryptSecureENC (objHandle: HCkCrypt2; secureStr: HCkSecureString; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncryptSecureENC(_map(183, 'CkCrypt2_EncryptSecureENC'))
    (objHandle, secureStr, outStr);
end;

function CkCrypt2__encryptSecureENC (objHandle: HCkCrypt2; secureStr: HCkSecureString): PWideChar;
begin
  result := TCkCrypt2__encryptSecureENC(_map(184, 'CkCrypt2__encryptSecureENC'))
    (objHandle, secureStr);
end;

function CkCrypt2_EncryptStream (objHandle: HCkCrypt2; strm: HCkStream): wordbool;
begin
  result := TCkCrypt2_EncryptStream(_map(185, 'CkCrypt2_EncryptStream'))
    (objHandle, strm);
end;

function CkCrypt2_EncryptStreamAsync (objHandle: HCkCrypt2; strm: HCkStream): HCkTask;
begin
  result := TCkCrypt2_EncryptStreamAsync(_map(186, 'CkCrypt2_EncryptStreamAsync'))
    (objHandle, strm);
end;

function CkCrypt2_EncryptString (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_EncryptString(_map(187, 'CkCrypt2_EncryptString'))
    (objHandle, str, outData);
end;

function CkCrypt2_EncryptStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_EncryptStringENC(_map(188, 'CkCrypt2_EncryptStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__encryptStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__encryptStringENC(_map(189, 'CkCrypt2__encryptStringENC'))
    (objHandle, str);
end;

function CkCrypt2_GenEncodedSecretKey (objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GenEncodedSecretKey(_map(190, 'CkCrypt2_GenEncodedSecretKey'))
    (objHandle, password, encoding, outStr);
end;

function CkCrypt2__genEncodedSecretKey (objHandle: HCkCrypt2; password: PWideChar; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__genEncodedSecretKey(_map(191, 'CkCrypt2__genEncodedSecretKey'))
    (objHandle, password, encoding);
end;

function CkCrypt2_GenerateSecretKey (objHandle: HCkCrypt2; password: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_GenerateSecretKey(_map(192, 'CkCrypt2_GenerateSecretKey'))
    (objHandle, password, outData);
end;

function CkCrypt2_GenerateUuid (objHandle: HCkCrypt2; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GenerateUuid(_map(193, 'CkCrypt2_GenerateUuid'))
    (objHandle, outStr);
end;

function CkCrypt2__generateUuid (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__generateUuid(_map(194, 'CkCrypt2__generateUuid'))
    (objHandle);
end;

function CkCrypt2_GenRandomBytesENC (objHandle: HCkCrypt2; numBytes: Integer; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GenRandomBytesENC(_map(195, 'CkCrypt2_GenRandomBytesENC'))
    (objHandle, numBytes, outStr);
end;

function CkCrypt2__genRandomBytesENC (objHandle: HCkCrypt2; numBytes: Integer): PWideChar;
begin
  result := TCkCrypt2__genRandomBytesENC(_map(196, 'CkCrypt2__genRandomBytesENC'))
    (objHandle, numBytes);
end;

function CkCrypt2_GetDecryptCert (objHandle: HCkCrypt2): HCkCert;
begin
  result := TCkCrypt2_GetDecryptCert(_map(197, 'CkCrypt2_GetDecryptCert'))
    (objHandle);
end;

function CkCrypt2_GetEncodedAad (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GetEncodedAad(_map(198, 'CkCrypt2_GetEncodedAad'))
    (objHandle, encoding, outStr);
end;

function CkCrypt2__getEncodedAad (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__getEncodedAad(_map(199, 'CkCrypt2__getEncodedAad'))
    (objHandle, encoding);
end;

function CkCrypt2_GetEncodedAuthTag (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GetEncodedAuthTag(_map(200, 'CkCrypt2_GetEncodedAuthTag'))
    (objHandle, encoding, outStr);
end;

function CkCrypt2__getEncodedAuthTag (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__getEncodedAuthTag(_map(201, 'CkCrypt2__getEncodedAuthTag'))
    (objHandle, encoding);
end;

function CkCrypt2_GetEncodedIV (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GetEncodedIV(_map(202, 'CkCrypt2_GetEncodedIV'))
    (objHandle, encoding, outStr);
end;

function CkCrypt2__getEncodedIV (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__getEncodedIV(_map(203, 'CkCrypt2__getEncodedIV'))
    (objHandle, encoding);
end;

function CkCrypt2_GetEncodedKey (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GetEncodedKey(_map(204, 'CkCrypt2_GetEncodedKey'))
    (objHandle, encoding, outStr);
end;

function CkCrypt2__getEncodedKey (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__getEncodedKey(_map(205, 'CkCrypt2__getEncodedKey'))
    (objHandle, encoding);
end;

function CkCrypt2_GetEncodedSalt (objHandle: HCkCrypt2; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GetEncodedSalt(_map(206, 'CkCrypt2_GetEncodedSalt'))
    (objHandle, encoding, outStr);
end;

function CkCrypt2__getEncodedSalt (objHandle: HCkCrypt2; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__getEncodedSalt(_map(207, 'CkCrypt2__getEncodedSalt'))
    (objHandle, encoding);
end;

function CkCrypt2_GetLastCert (objHandle: HCkCrypt2): HCkCert;
begin
  result := TCkCrypt2_GetLastCert(_map(208, 'CkCrypt2_GetLastCert'))
    (objHandle);
end;

function CkCrypt2_GetSignatureSigningTimeStr (objHandle: HCkCrypt2; index: Integer; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_GetSignatureSigningTimeStr(_map(209, 'CkCrypt2_GetSignatureSigningTimeStr'))
    (objHandle, index, outStr);
end;

function CkCrypt2__getSignatureSigningTimeStr (objHandle: HCkCrypt2; index: Integer): PWideChar;
begin
  result := TCkCrypt2__getSignatureSigningTimeStr(_map(210, 'CkCrypt2__getSignatureSigningTimeStr'))
    (objHandle, index);
end;

function CkCrypt2_GetSignedAttributes (objHandle: HCkCrypt2; signerIndex: Integer; pkcs7Der: HCkBinData; sbJson: HCkStringBuilder): wordbool;
begin
  result := TCkCrypt2_GetSignedAttributes(_map(211, 'CkCrypt2_GetSignedAttributes'))
    (objHandle, signerIndex, pkcs7Der, sbJson);
end;

function CkCrypt2_GetSignerCert (objHandle: HCkCrypt2; index: Integer): HCkCert;
begin
  result := TCkCrypt2_GetSignerCert(_map(212, 'CkCrypt2_GetSignerCert'))
    (objHandle, index);
end;

function CkCrypt2_GetSignerCertChain (objHandle: HCkCrypt2; index: Integer): HCkCertChain;
begin
  result := TCkCrypt2_GetSignerCertChain(_map(213, 'CkCrypt2_GetSignerCertChain'))
    (objHandle, index);
end;

function CkCrypt2_HashBdENC (objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HashBdENC(_map(214, 'CkCrypt2_HashBdENC'))
    (objHandle, bd, outStr);
end;

function CkCrypt2__hashBdENC (objHandle: HCkCrypt2; bd: HCkBinData): PWideChar;
begin
  result := TCkCrypt2__hashBdENC(_map(215, 'CkCrypt2__hashBdENC'))
    (objHandle, bd);
end;

function CkCrypt2_HashBeginBytes (objHandle: HCkCrypt2; data: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashBeginBytes(_map(216, 'CkCrypt2_HashBeginBytes'))
    (objHandle, data);
end;

function CkCrypt2_HashBeginBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord): wordbool;
begin
  result := TCkCrypt2_HashBeginBytes2(_map(217, 'CkCrypt2_HashBeginBytes2'))
    (objHandle, pByteData, szByteData);
end;

function CkCrypt2_HashBeginString (objHandle: HCkCrypt2; strData: PWideChar): wordbool;
begin
  result := TCkCrypt2_HashBeginString(_map(218, 'CkCrypt2_HashBeginString'))
    (objHandle, strData);
end;

function CkCrypt2_HashBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashBytes(_map(219, 'CkCrypt2_HashBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_HashBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashBytes2(_map(220, 'CkCrypt2_HashBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_HashBytesENC (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HashBytesENC(_map(221, 'CkCrypt2_HashBytesENC'))
    (objHandle, data, outStr);
end;

function CkCrypt2__hashBytesENC (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__hashBytesENC(_map(222, 'CkCrypt2__hashBytesENC'))
    (objHandle, data);
end;

function CkCrypt2_HashFile (objHandle: HCkCrypt2; path: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashFile(_map(223, 'CkCrypt2_HashFile'))
    (objHandle, path, outData);
end;

function CkCrypt2_HashFileAsync (objHandle: HCkCrypt2; path: PWideChar): HCkTask;
begin
  result := TCkCrypt2_HashFileAsync(_map(224, 'CkCrypt2_HashFileAsync'))
    (objHandle, path);
end;

function CkCrypt2_HashFileENC (objHandle: HCkCrypt2; path: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HashFileENC(_map(225, 'CkCrypt2_HashFileENC'))
    (objHandle, path, outStr);
end;

function CkCrypt2__hashFileENC (objHandle: HCkCrypt2; path: PWideChar): PWideChar;
begin
  result := TCkCrypt2__hashFileENC(_map(226, 'CkCrypt2__hashFileENC'))
    (objHandle, path);
end;

function CkCrypt2_HashFileENCAsync (objHandle: HCkCrypt2; path: PWideChar): HCkTask;
begin
  result := TCkCrypt2_HashFileENCAsync(_map(227, 'CkCrypt2_HashFileENCAsync'))
    (objHandle, path);
end;

function CkCrypt2_HashFinal (objHandle: HCkCrypt2; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashFinal(_map(228, 'CkCrypt2_HashFinal'))
    (objHandle, outData);
end;

function CkCrypt2_HashFinalENC (objHandle: HCkCrypt2; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HashFinalENC(_map(229, 'CkCrypt2_HashFinalENC'))
    (objHandle, outStr);
end;

function CkCrypt2__hashFinalENC (objHandle: HCkCrypt2): PWideChar;
begin
  result := TCkCrypt2__hashFinalENC(_map(230, 'CkCrypt2__hashFinalENC'))
    (objHandle);
end;

function CkCrypt2_HashMoreBytes (objHandle: HCkCrypt2; data: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashMoreBytes(_map(231, 'CkCrypt2_HashMoreBytes'))
    (objHandle, data);
end;

function CkCrypt2_HashMoreBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord): wordbool;
begin
  result := TCkCrypt2_HashMoreBytes2(_map(232, 'CkCrypt2_HashMoreBytes2'))
    (objHandle, pByteData, szByteData);
end;

function CkCrypt2_HashMoreString (objHandle: HCkCrypt2; strData: PWideChar): wordbool;
begin
  result := TCkCrypt2_HashMoreString(_map(233, 'CkCrypt2_HashMoreString'))
    (objHandle, strData);
end;

function CkCrypt2_HashString (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HashString(_map(234, 'CkCrypt2_HashString'))
    (objHandle, str, outData);
end;

function CkCrypt2_HashStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HashStringENC(_map(235, 'CkCrypt2_HashStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__hashStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__hashStringENC(_map(236, 'CkCrypt2__hashStringENC'))
    (objHandle, str);
end;

function CkCrypt2_HasSignatureSigningTime (objHandle: HCkCrypt2; index: Integer): wordbool;
begin
  result := TCkCrypt2_HasSignatureSigningTime(_map(237, 'CkCrypt2_HasSignatureSigningTime'))
    (objHandle, index);
end;

function CkCrypt2_HmacBytes (objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HmacBytes(_map(238, 'CkCrypt2_HmacBytes'))
    (objHandle, inBytes, outData);
end;

function CkCrypt2_HmacBytesENC (objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HmacBytesENC(_map(239, 'CkCrypt2_HmacBytesENC'))
    (objHandle, inBytes, outStr);
end;

function CkCrypt2__hmacBytesENC (objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__hmacBytesENC(_map(240, 'CkCrypt2__hmacBytesENC'))
    (objHandle, inBytes);
end;

function CkCrypt2_HmacString (objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_HmacString(_map(241, 'CkCrypt2_HmacString'))
    (objHandle, inText, outData);
end;

function CkCrypt2_HmacStringENC (objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_HmacStringENC(_map(242, 'CkCrypt2_HmacStringENC'))
    (objHandle, inText, outStr);
end;

function CkCrypt2__hmacStringENC (objHandle: HCkCrypt2; inText: PWideChar): PWideChar;
begin
  result := TCkCrypt2__hmacStringENC(_map(243, 'CkCrypt2__hmacStringENC'))
    (objHandle, inText);
end;

function CkCrypt2_Hotp (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_Hotp(_map(244, 'CkCrypt2_Hotp'))
    (objHandle, secret, secretEnc, counterHex, numDigits, truncOffset, hashAlg, outStr);
end;

function CkCrypt2__hotp (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; counterHex: PWideChar; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar;
begin
  result := TCkCrypt2__hotp(_map(245, 'CkCrypt2__hotp'))
    (objHandle, secret, secretEnc, counterHex, numDigits, truncOffset, hashAlg);
end;

function CkCrypt2_InflateBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_InflateBytes(_map(246, 'CkCrypt2_InflateBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_InflateBytesENC (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_InflateBytesENC(_map(247, 'CkCrypt2_InflateBytesENC'))
    (objHandle, str, outData);
end;

function CkCrypt2_InflateString (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_InflateString(_map(248, 'CkCrypt2_InflateString'))
    (objHandle, data, outStr);
end;

function CkCrypt2__inflateString (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__inflateString(_map(249, 'CkCrypt2__inflateString'))
    (objHandle, data);
end;

function CkCrypt2_InflateStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_InflateStringENC(_map(250, 'CkCrypt2_InflateStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__inflateStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__inflateStringENC(_map(251, 'CkCrypt2__inflateStringENC'))
    (objHandle, str);
end;

function CkCrypt2_IsUnlocked (objHandle: HCkCrypt2): wordbool;
begin
  result := TCkCrypt2_IsUnlocked(_map(252, 'CkCrypt2_IsUnlocked'))
    (objHandle);
end;

function CkCrypt2_LastJsonData (objHandle: HCkCrypt2): HCkJsonObject;
begin
  result := TCkCrypt2_LastJsonData(_map(253, 'CkCrypt2_LastJsonData'))
    (objHandle);
end;

function CkCrypt2_LoadTaskCaller (objHandle: HCkCrypt2; task: HCkTask): wordbool;
begin
  result := TCkCrypt2_LoadTaskCaller(_map(254, 'CkCrypt2_LoadTaskCaller'))
    (objHandle, task);
end;

function CkCrypt2_MacBdENC (objHandle: HCkCrypt2; bd: HCkBinData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_MacBdENC(_map(255, 'CkCrypt2_MacBdENC'))
    (objHandle, bd, outStr);
end;

function CkCrypt2__macBdENC (objHandle: HCkCrypt2; bd: HCkBinData): PWideChar;
begin
  result := TCkCrypt2__macBdENC(_map(256, 'CkCrypt2__macBdENC'))
    (objHandle, bd);
end;

function CkCrypt2_MacBytes (objHandle: HCkCrypt2; inBytes: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_MacBytes(_map(257, 'CkCrypt2_MacBytes'))
    (objHandle, inBytes, outData);
end;

function CkCrypt2_MacBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_MacBytes2(_map(258, 'CkCrypt2_MacBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_MacBytesENC (objHandle: HCkCrypt2; inBytes: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_MacBytesENC(_map(259, 'CkCrypt2_MacBytesENC'))
    (objHandle, inBytes, outStr);
end;

function CkCrypt2__macBytesENC (objHandle: HCkCrypt2; inBytes: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__macBytesENC(_map(260, 'CkCrypt2__macBytesENC'))
    (objHandle, inBytes);
end;

function CkCrypt2_MacString (objHandle: HCkCrypt2; inText: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_MacString(_map(261, 'CkCrypt2_MacString'))
    (objHandle, inText, outData);
end;

function CkCrypt2_MacStringENC (objHandle: HCkCrypt2; inText: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_MacStringENC(_map(262, 'CkCrypt2_MacStringENC'))
    (objHandle, inText, outStr);
end;

function CkCrypt2__macStringENC (objHandle: HCkCrypt2; inText: PWideChar): PWideChar;
begin
  result := TCkCrypt2__macStringENC(_map(263, 'CkCrypt2__macStringENC'))
    (objHandle, inText);
end;

function CkCrypt2_MySqlAesDecrypt (objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_MySqlAesDecrypt(_map(264, 'CkCrypt2_MySqlAesDecrypt'))
    (objHandle, strEncryptedHex, strPassword, outStr);
end;

function CkCrypt2__mySqlAesDecrypt (objHandle: HCkCrypt2; strEncryptedHex: PWideChar; strPassword: PWideChar): PWideChar;
begin
  result := TCkCrypt2__mySqlAesDecrypt(_map(265, 'CkCrypt2__mySqlAesDecrypt'))
    (objHandle, strEncryptedHex, strPassword);
end;

function CkCrypt2_MySqlAesEncrypt (objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_MySqlAesEncrypt(_map(266, 'CkCrypt2_MySqlAesEncrypt'))
    (objHandle, strData, strPassword, outStr);
end;

function CkCrypt2__mySqlAesEncrypt (objHandle: HCkCrypt2; strData: PWideChar; strPassword: PWideChar): PWideChar;
begin
  result := TCkCrypt2__mySqlAesEncrypt(_map(267, 'CkCrypt2__mySqlAesEncrypt'))
    (objHandle, strData, strPassword);
end;

function CkCrypt2_OpaqueSignBd (objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
begin
  result := TCkCrypt2_OpaqueSignBd(_map(268, 'CkCrypt2_OpaqueSignBd'))
    (objHandle, bd);
end;

function CkCrypt2_OpaqueSignBdAsync (objHandle: HCkCrypt2; bd: HCkBinData): HCkTask;
begin
  result := TCkCrypt2_OpaqueSignBdAsync(_map(269, 'CkCrypt2_OpaqueSignBdAsync'))
    (objHandle, bd);
end;

function CkCrypt2_OpaqueSignBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_OpaqueSignBytes(_map(270, 'CkCrypt2_OpaqueSignBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_OpaqueSignBytesAsync (objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
begin
  result := TCkCrypt2_OpaqueSignBytesAsync(_map(271, 'CkCrypt2_OpaqueSignBytesAsync'))
    (objHandle, data);
end;

function CkCrypt2_OpaqueSignBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_OpaqueSignBytes2(_map(272, 'CkCrypt2_OpaqueSignBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_OpaqueSignBytesENC (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_OpaqueSignBytesENC(_map(273, 'CkCrypt2_OpaqueSignBytesENC'))
    (objHandle, data, outStr);
end;

function CkCrypt2__opaqueSignBytesENC (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__opaqueSignBytesENC(_map(274, 'CkCrypt2__opaqueSignBytesENC'))
    (objHandle, data);
end;

function CkCrypt2_OpaqueSignBytesENCAsync (objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
begin
  result := TCkCrypt2_OpaqueSignBytesENCAsync(_map(275, 'CkCrypt2_OpaqueSignBytesENCAsync'))
    (objHandle, data);
end;

function CkCrypt2_OpaqueSignString (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_OpaqueSignString(_map(276, 'CkCrypt2_OpaqueSignString'))
    (objHandle, str, outData);
end;

function CkCrypt2_OpaqueSignStringAsync (objHandle: HCkCrypt2; str: PWideChar): HCkTask;
begin
  result := TCkCrypt2_OpaqueSignStringAsync(_map(277, 'CkCrypt2_OpaqueSignStringAsync'))
    (objHandle, str);
end;

function CkCrypt2_OpaqueSignStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_OpaqueSignStringENC(_map(278, 'CkCrypt2_OpaqueSignStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__opaqueSignStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__opaqueSignStringENC(_map(279, 'CkCrypt2__opaqueSignStringENC'))
    (objHandle, str);
end;

function CkCrypt2_OpaqueSignStringENCAsync (objHandle: HCkCrypt2; str: PWideChar): HCkTask;
begin
  result := TCkCrypt2_OpaqueSignStringENCAsync(_map(280, 'CkCrypt2_OpaqueSignStringENCAsync'))
    (objHandle, str);
end;

function CkCrypt2_OpaqueVerifyBd (objHandle: HCkCrypt2; bd: HCkBinData): wordbool;
begin
  result := TCkCrypt2_OpaqueVerifyBd(_map(281, 'CkCrypt2_OpaqueVerifyBd'))
    (objHandle, bd);
end;

function CkCrypt2_OpaqueVerifyBytes (objHandle: HCkCrypt2; p7s: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_OpaqueVerifyBytes(_map(282, 'CkCrypt2_OpaqueVerifyBytes'))
    (objHandle, p7s, outData);
end;

function CkCrypt2_OpaqueVerifyBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_OpaqueVerifyBytes2(_map(283, 'CkCrypt2_OpaqueVerifyBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_OpaqueVerifyBytesENC (objHandle: HCkCrypt2; p7s: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_OpaqueVerifyBytesENC(_map(284, 'CkCrypt2_OpaqueVerifyBytesENC'))
    (objHandle, p7s, outData);
end;

function CkCrypt2_OpaqueVerifyString (objHandle: HCkCrypt2; p7s: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_OpaqueVerifyString(_map(285, 'CkCrypt2_OpaqueVerifyString'))
    (objHandle, p7s, outStr);
end;

function CkCrypt2__opaqueVerifyString (objHandle: HCkCrypt2; p7s: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__opaqueVerifyString(_map(286, 'CkCrypt2__opaqueVerifyString'))
    (objHandle, p7s);
end;

function CkCrypt2_OpaqueVerifyStringENC (objHandle: HCkCrypt2; p7s: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_OpaqueVerifyStringENC(_map(287, 'CkCrypt2_OpaqueVerifyStringENC'))
    (objHandle, p7s, outStr);
end;

function CkCrypt2__opaqueVerifyStringENC (objHandle: HCkCrypt2; p7s: PWideChar): PWideChar;
begin
  result := TCkCrypt2__opaqueVerifyStringENC(_map(288, 'CkCrypt2__opaqueVerifyStringENC'))
    (objHandle, p7s);
end;

function CkCrypt2_Pbkdf1 (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_Pbkdf1(_map(289, 'CkCrypt2_Pbkdf1'))
    (objHandle, password, charset, hashAlg, salt, iterationCount, outputKeyBitLen, encoding, outStr);
end;

function CkCrypt2__pbkdf1 (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__pbkdf1(_map(290, 'CkCrypt2__pbkdf1'))
    (objHandle, password, charset, hashAlg, salt, iterationCount, outputKeyBitLen, encoding);
end;

function CkCrypt2_Pbkdf2 (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_Pbkdf2(_map(291, 'CkCrypt2_Pbkdf2'))
    (objHandle, password, charset, hashAlg, salt, iterationCount, outputKeyBitLen, encoding, outStr);
end;

function CkCrypt2__pbkdf2 (objHandle: HCkCrypt2; password: PWideChar; charset: PWideChar; hashAlg: PWideChar; salt: PWideChar; iterationCount: Integer; outputKeyBitLen: Integer; encoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__pbkdf2(_map(292, 'CkCrypt2__pbkdf2'))
    (objHandle, password, charset, hashAlg, salt, iterationCount, outputKeyBitLen, encoding);
end;

function CkCrypt2_Pkcs7ExtractDigest (objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_Pkcs7ExtractDigest(_map(293, 'CkCrypt2_Pkcs7ExtractDigest'))
    (objHandle, signerIndex, pkcs7, outStr);
end;

function CkCrypt2__pkcs7ExtractDigest (objHandle: HCkCrypt2; signerIndex: Integer; pkcs7: PWideChar): PWideChar;
begin
  result := TCkCrypt2__pkcs7ExtractDigest(_map(294, 'CkCrypt2__pkcs7ExtractDigest'))
    (objHandle, signerIndex, pkcs7);
end;

procedure CkCrypt2_RandomizeIV (objHandle: HCkCrypt2);
begin
  TCkCrypt2_RandomizeIV(_map(295, 'CkCrypt2_RandomizeIV'))
    (objHandle);
end;

procedure CkCrypt2_RandomizeKey (objHandle: HCkCrypt2);
begin
  TCkCrypt2_RandomizeKey(_map(296, 'CkCrypt2_RandomizeKey'))
    (objHandle);
end;

function CkCrypt2_ReadFile (objHandle: HCkCrypt2; filename: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_ReadFile(_map(297, 'CkCrypt2_ReadFile'))
    (objHandle, filename, outData);
end;

function CkCrypt2_ReEncode (objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_ReEncode(_map(298, 'CkCrypt2_ReEncode'))
    (objHandle, encodedData, fromEncoding, toEncoding, outStr);
end;

function CkCrypt2__reEncode (objHandle: HCkCrypt2; encodedData: PWideChar; fromEncoding: PWideChar; toEncoding: PWideChar): PWideChar;
begin
  result := TCkCrypt2__reEncode(_map(299, 'CkCrypt2__reEncode'))
    (objHandle, encodedData, fromEncoding, toEncoding);
end;

function CkCrypt2_SaveLastError (objHandle: HCkCrypt2; path: PWideChar): wordbool;
begin
  result := TCkCrypt2_SaveLastError(_map(300, 'CkCrypt2_SaveLastError'))
    (objHandle, path);
end;

function CkCrypt2_SetDecryptCert (objHandle: HCkCrypt2; cert: HCkCert): wordbool;
begin
  result := TCkCrypt2_SetDecryptCert(_map(301, 'CkCrypt2_SetDecryptCert'))
    (objHandle, cert);
end;

function CkCrypt2_SetDecryptCert2 (objHandle: HCkCrypt2; cert: HCkCert; key: HCkPrivateKey): wordbool;
begin
  result := TCkCrypt2_SetDecryptCert2(_map(302, 'CkCrypt2_SetDecryptCert2'))
    (objHandle, cert, key);
end;

function CkCrypt2_SetEncodedAad (objHandle: HCkCrypt2; aadStr: PWideChar; encoding: PWideChar): wordbool;
begin
  result := TCkCrypt2_SetEncodedAad(_map(303, 'CkCrypt2_SetEncodedAad'))
    (objHandle, aadStr, encoding);
end;

function CkCrypt2_SetEncodedAuthTag (objHandle: HCkCrypt2; authTagStr: PWideChar; encoding: PWideChar): wordbool;
begin
  result := TCkCrypt2_SetEncodedAuthTag(_map(304, 'CkCrypt2_SetEncodedAuthTag'))
    (objHandle, authTagStr, encoding);
end;

procedure CkCrypt2_SetEncodedIV (objHandle: HCkCrypt2; ivStr: PWideChar; encoding: PWideChar);
begin
  TCkCrypt2_SetEncodedIV(_map(305, 'CkCrypt2_SetEncodedIV'))
    (objHandle, ivStr, encoding);
end;

procedure CkCrypt2_SetEncodedKey (objHandle: HCkCrypt2; keyStr: PWideChar; encoding: PWideChar);
begin
  TCkCrypt2_SetEncodedKey(_map(306, 'CkCrypt2_SetEncodedKey'))
    (objHandle, keyStr, encoding);
end;

procedure CkCrypt2_SetEncodedSalt (objHandle: HCkCrypt2; saltStr: PWideChar; encoding: PWideChar);
begin
  TCkCrypt2_SetEncodedSalt(_map(307, 'CkCrypt2_SetEncodedSalt'))
    (objHandle, saltStr, encoding);
end;

function CkCrypt2_SetEncryptCert (objHandle: HCkCrypt2; cert: HCkCert): wordbool;
begin
  result := TCkCrypt2_SetEncryptCert(_map(308, 'CkCrypt2_SetEncryptCert'))
    (objHandle, cert);
end;

procedure CkCrypt2_SetHmacKeyBytes (objHandle: HCkCrypt2; keyBytes: HCkByteData);
begin
  TCkCrypt2_SetHmacKeyBytes(_map(309, 'CkCrypt2_SetHmacKeyBytes'))
    (objHandle, keyBytes);
end;

procedure CkCrypt2_SetHmacKeyEncoded (objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar);
begin
  TCkCrypt2_SetHmacKeyEncoded(_map(310, 'CkCrypt2_SetHmacKeyEncoded'))
    (objHandle, key, encoding);
end;

procedure CkCrypt2_SetHmacKeyString (objHandle: HCkCrypt2; key: PWideChar);
begin
  TCkCrypt2_SetHmacKeyString(_map(311, 'CkCrypt2_SetHmacKeyString'))
    (objHandle, key);
end;

procedure CkCrypt2_SetIV (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord);
begin
  TCkCrypt2_SetIV(_map(312, 'CkCrypt2_SetIV'))
    (objHandle, pByteData, szByteData);
end;

function CkCrypt2_SetMacKeyBytes (objHandle: HCkCrypt2; keyBytes: HCkByteData): wordbool;
begin
  result := TCkCrypt2_SetMacKeyBytes(_map(313, 'CkCrypt2_SetMacKeyBytes'))
    (objHandle, keyBytes);
end;

function CkCrypt2_SetMacKeyEncoded (objHandle: HCkCrypt2; key: PWideChar; encoding: PWideChar): wordbool;
begin
  result := TCkCrypt2_SetMacKeyEncoded(_map(314, 'CkCrypt2_SetMacKeyEncoded'))
    (objHandle, key, encoding);
end;

function CkCrypt2_SetMacKeyString (objHandle: HCkCrypt2; key: PWideChar): wordbool;
begin
  result := TCkCrypt2_SetMacKeyString(_map(315, 'CkCrypt2_SetMacKeyString'))
    (objHandle, key);
end;

procedure CkCrypt2_SetSecretKey (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord);
begin
  TCkCrypt2_SetSecretKey(_map(316, 'CkCrypt2_SetSecretKey'))
    (objHandle, pByteData, szByteData);
end;

procedure CkCrypt2_SetSecretKeyViaPassword (objHandle: HCkCrypt2; password: PWideChar);
begin
  TCkCrypt2_SetSecretKeyViaPassword(_map(317, 'CkCrypt2_SetSecretKeyViaPassword'))
    (objHandle, password);
end;

function CkCrypt2_SetSigningCert (objHandle: HCkCrypt2; cert: HCkCert): wordbool;
begin
  result := TCkCrypt2_SetSigningCert(_map(318, 'CkCrypt2_SetSigningCert'))
    (objHandle, cert);
end;

function CkCrypt2_SetSigningCert2 (objHandle: HCkCrypt2; cert: HCkCert; privateKey: HCkPrivateKey): wordbool;
begin
  result := TCkCrypt2_SetSigningCert2(_map(319, 'CkCrypt2_SetSigningCert2'))
    (objHandle, cert, privateKey);
end;

procedure CkCrypt2_SetTsaHttpObj (objHandle: HCkCrypt2; http: HCkHttp);
begin
  TCkCrypt2_SetTsaHttpObj(_map(320, 'CkCrypt2_SetTsaHttpObj'))
    (objHandle, http);
end;

function CkCrypt2_SetVerifyCert (objHandle: HCkCrypt2; cert: HCkCert): wordbool;
begin
  result := TCkCrypt2_SetVerifyCert(_map(321, 'CkCrypt2_SetVerifyCert'))
    (objHandle, cert);
end;

function CkCrypt2_SignBdENC (objHandle: HCkCrypt2; dataToSign: HCkBinData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_SignBdENC(_map(322, 'CkCrypt2_SignBdENC'))
    (objHandle, dataToSign, outStr);
end;

function CkCrypt2__signBdENC (objHandle: HCkCrypt2; dataToSign: HCkBinData): PWideChar;
begin
  result := TCkCrypt2__signBdENC(_map(323, 'CkCrypt2__signBdENC'))
    (objHandle, dataToSign);
end;

function CkCrypt2_SignBdENCAsync (objHandle: HCkCrypt2; dataToSign: HCkBinData): HCkTask;
begin
  result := TCkCrypt2_SignBdENCAsync(_map(324, 'CkCrypt2_SignBdENCAsync'))
    (objHandle, dataToSign);
end;

function CkCrypt2_SignBytes (objHandle: HCkCrypt2; data: HCkByteData; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_SignBytes(_map(325, 'CkCrypt2_SignBytes'))
    (objHandle, data, outData);
end;

function CkCrypt2_SignBytesAsync (objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
begin
  result := TCkCrypt2_SignBytesAsync(_map(326, 'CkCrypt2_SignBytesAsync'))
    (objHandle, data);
end;

function CkCrypt2_SignBytes2 (objHandle: HCkCrypt2; pByteData: pbyte; szByteData: LongWord; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_SignBytes2(_map(327, 'CkCrypt2_SignBytes2'))
    (objHandle, pByteData, szByteData, outData);
end;

function CkCrypt2_SignBytesENC (objHandle: HCkCrypt2; data: HCkByteData; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_SignBytesENC(_map(328, 'CkCrypt2_SignBytesENC'))
    (objHandle, data, outStr);
end;

function CkCrypt2__signBytesENC (objHandle: HCkCrypt2; data: HCkByteData): PWideChar;
begin
  result := TCkCrypt2__signBytesENC(_map(329, 'CkCrypt2__signBytesENC'))
    (objHandle, data);
end;

function CkCrypt2_SignBytesENCAsync (objHandle: HCkCrypt2; data: HCkByteData): HCkTask;
begin
  result := TCkCrypt2_SignBytesENCAsync(_map(330, 'CkCrypt2_SignBytesENCAsync'))
    (objHandle, data);
end;

function CkCrypt2_SignSbENC (objHandle: HCkCrypt2; sb: HCkStringBuilder; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_SignSbENC(_map(331, 'CkCrypt2_SignSbENC'))
    (objHandle, sb, outStr);
end;

function CkCrypt2__signSbENC (objHandle: HCkCrypt2; sb: HCkStringBuilder): PWideChar;
begin
  result := TCkCrypt2__signSbENC(_map(332, 'CkCrypt2__signSbENC'))
    (objHandle, sb);
end;

function CkCrypt2_SignSbENCAsync (objHandle: HCkCrypt2; sb: HCkStringBuilder): HCkTask;
begin
  result := TCkCrypt2_SignSbENCAsync(_map(333, 'CkCrypt2_SignSbENCAsync'))
    (objHandle, sb);
end;

function CkCrypt2_SignString (objHandle: HCkCrypt2; str: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_SignString(_map(334, 'CkCrypt2_SignString'))
    (objHandle, str, outData);
end;

function CkCrypt2_SignStringAsync (objHandle: HCkCrypt2; str: PWideChar): HCkTask;
begin
  result := TCkCrypt2_SignStringAsync(_map(335, 'CkCrypt2_SignStringAsync'))
    (objHandle, str);
end;

function CkCrypt2_SignStringENC (objHandle: HCkCrypt2; str: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_SignStringENC(_map(336, 'CkCrypt2_SignStringENC'))
    (objHandle, str, outStr);
end;

function CkCrypt2__signStringENC (objHandle: HCkCrypt2; str: PWideChar): PWideChar;
begin
  result := TCkCrypt2__signStringENC(_map(337, 'CkCrypt2__signStringENC'))
    (objHandle, str);
end;

function CkCrypt2_SignStringENCAsync (objHandle: HCkCrypt2; str: PWideChar): HCkTask;
begin
  result := TCkCrypt2_SignStringENCAsync(_map(338, 'CkCrypt2_SignStringENCAsync'))
    (objHandle, str);
end;

function CkCrypt2_StringToBytes (objHandle: HCkCrypt2; inStr: PWideChar; charset: PWideChar; outData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_StringToBytes(_map(339, 'CkCrypt2_StringToBytes'))
    (objHandle, inStr, charset, outData);
end;

function CkCrypt2_Totp (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_Totp(_map(340, 'CkCrypt2_Totp'))
    (objHandle, secret, secretEnc, t0, tNow, tStep, numDigits, truncOffset, hashAlg, outStr);
end;

function CkCrypt2__totp (objHandle: HCkCrypt2; secret: PWideChar; secretEnc: PWideChar; t0: PWideChar; tNow: PWideChar; tStep: Integer; numDigits: Integer; truncOffset: Integer; hashAlg: PWideChar): PWideChar;
begin
  result := TCkCrypt2__totp(_map(341, 'CkCrypt2__totp'))
    (objHandle, secret, secretEnc, t0, tNow, tStep, numDigits, truncOffset, hashAlg);
end;

function CkCrypt2_TrimEndingWith (objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar; outStr: HCkString): wordbool;
begin
  result := TCkCrypt2_TrimEndingWith(_map(342, 'CkCrypt2_TrimEndingWith'))
    (objHandle, inStr, ending, outStr);
end;

function CkCrypt2__trimEndingWith (objHandle: HCkCrypt2; inStr: PWideChar; ending: PWideChar): PWideChar;
begin
  result := TCkCrypt2__trimEndingWith(_map(343, 'CkCrypt2__trimEndingWith'))
    (objHandle, inStr, ending);
end;

function CkCrypt2_UnlockComponent (objHandle: HCkCrypt2; unlockCode: PWideChar): wordbool;
begin
  result := TCkCrypt2_UnlockComponent(_map(344, 'CkCrypt2_UnlockComponent'))
    (objHandle, unlockCode);
end;

function CkCrypt2_UseCertVault (objHandle: HCkCrypt2; vault: HCkXmlCertVault): wordbool;
begin
  result := TCkCrypt2_UseCertVault(_map(345, 'CkCrypt2_UseCertVault'))
    (objHandle, vault);
end;

function CkCrypt2_VerifyBdENC (objHandle: HCkCrypt2; data: HCkBinData; encodedSig: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifyBdENC(_map(346, 'CkCrypt2_VerifyBdENC'))
    (objHandle, data, encodedSig);
end;

function CkCrypt2_VerifyBytes (objHandle: HCkCrypt2; data: HCkByteData; sig: HCkByteData): wordbool;
begin
  result := TCkCrypt2_VerifyBytes(_map(347, 'CkCrypt2_VerifyBytes'))
    (objHandle, data, sig);
end;

function CkCrypt2_VerifyBytesENC (objHandle: HCkCrypt2; data: HCkByteData; encodedSig: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifyBytesENC(_map(348, 'CkCrypt2_VerifyBytesENC'))
    (objHandle, data, encodedSig);
end;

function CkCrypt2_VerifyDetachedSignature (objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifyDetachedSignature(_map(349, 'CkCrypt2_VerifyDetachedSignature'))
    (objHandle, inFilename, p7sFilename);
end;

function CkCrypt2_VerifyP7M (objHandle: HCkCrypt2; p7mPath: PWideChar; destPath: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifyP7M(_map(350, 'CkCrypt2_VerifyP7M'))
    (objHandle, p7mPath, destPath);
end;

function CkCrypt2_VerifyP7S (objHandle: HCkCrypt2; inFilename: PWideChar; p7sFilename: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifyP7S(_map(351, 'CkCrypt2_VerifyP7S'))
    (objHandle, inFilename, p7sFilename);
end;

function CkCrypt2_VerifySbENC (objHandle: HCkCrypt2; sb: HCkStringBuilder; encodedSig: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifySbENC(_map(352, 'CkCrypt2_VerifySbENC'))
    (objHandle, sb, encodedSig);
end;

function CkCrypt2_VerifyString (objHandle: HCkCrypt2; str: PWideChar; sig: HCkByteData): wordbool;
begin
  result := TCkCrypt2_VerifyString(_map(353, 'CkCrypt2_VerifyString'))
    (objHandle, str, sig);
end;

function CkCrypt2_VerifyStringENC (objHandle: HCkCrypt2; str: PWideChar; encodedSig: PWideChar): wordbool;
begin
  result := TCkCrypt2_VerifyStringENC(_map(354, 'CkCrypt2_VerifyStringENC'))
    (objHandle, str, encodedSig);
end;

function CkCrypt2_WriteFile (objHandle: HCkCrypt2; filename: PWideChar; fileData: HCkByteData): wordbool;
begin
  result := TCkCrypt2_WriteFile(_map(355, 'CkCrypt2_WriteFile'))
    (objHandle, filename, fileData);
end;

end.
