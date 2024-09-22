using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace ODMS.JWT_Logic
{
    public class Cryptography
    {
        static private string key;
        static private string iv;
        static private byte[] EncryptKey;
        static private byte[] IV;

        public Cryptography()
        {

            key = "jdsg43238sfsafdasdfasfasfsfagafAASGASFSFA7";
            iv = "LJlsjflkjldfgj87l";
            EncryptKey = Encoding.UTF8.GetBytes(key.Substring(0, 32));
            IV = Encoding.ASCII.GetBytes(iv.Substring(0, 16));

        }

        public string Encrypt(string plainText)
        {
            byte[] encrypted;


            // Create a new AesManaged.
            using (AesManaged aes = new AesManaged())
            {
                // Create encryptor
                ICryptoTransform encryptor = aes.CreateEncryptor(EncryptKey, IV);
                // Create MemoryStream
                using (MemoryStream ms = new MemoryStream())
                {
                    // Create crypto stream using the CryptoStream class. This class is the key to encryption
                    // and encrypts and decrypts data from any given stream. In this case, we will pass a memory stream
                    // to encrypt
                    using (CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    {
                        // Create StreamWriter and write data to a stream
                        using (StreamWriter sw = new StreamWriter(cs))
                            sw.Write(plainText);
                        encrypted = ms.ToArray();
                    }
                }
            }
            // Return encrypted data
            return Convert.ToBase64String(encrypted);
        }

        public string Decrypt(string cipherText)
        {
            string plaintext = null;
            byte[] inputByte = Convert.FromBase64String(cipherText);
            // Create AesManaged
            using (AesManaged aes = new AesManaged())
            {
                // Create a decryptor
                ICryptoTransform decryptor = aes.CreateDecryptor(EncryptKey, IV);
                // Create the streams used for decryption.
                using (MemoryStream ms = new MemoryStream(inputByte))
                {
                    // Create crypto stream
                    using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                    {
                        // Read crypto stream
                        using (StreamReader reader = new StreamReader(cs))
                            plaintext = reader.ReadToEnd();
                    }
                }
            }
            return plaintext;
        }
    }
}