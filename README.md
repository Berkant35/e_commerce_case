# Atomic Commit Rehberi

Bu projede atomic commit yaklaşımı kullanılmaktadır. Atomic commit, her bir commit'in tek bir değişikliği temsil etmesini sağlayarak kodun daha düzenli, anlaşılır ve geri alınabilir olmasını hedefler. Daha fazla bilgi için: [Atomic Commits Hakkında](https://medium.com/@krystalcampioni/advanced-git-guide-part-1-mastering-atomic-commits-and-enforcing-conventional-commits-1be401467a92)

## Commit Mesajı Formatı

Commit mesajları aşağıdaki yapıya uygun olarak yazılmıştır:

### Türler ve Anlamları

- **feat**: Yeni bir özellik eklendiğini belirtir.
- **fix**: Hata düzeltildiğini belirtir.
- **chore**: Fonksiyonellik içermeyen teknik güncellemeleri belirtir (ör. dokümantasyon, refaktör).

Bu format, commit geçmişinin anlaşılabilir ve izlenebilir olmasını sağlar.

---

## Projede Kullanılan Mimari

Bu projede **Feature-Base Data-Domain-Presentation** yaklaşımı benimsenmiştir. Bu yaklaşım, her bir özelliği katmanlı bir yapı içerisinde modüler olarak düzenler.

### Data-Domain-Presentation Nedir?

Data-Domain-Presentation, projeyi üç ana katmana ayırarak kodun daha okunabilir, test edilebilir ve sürdürülebilir olmasını sağlar:

1. **Data**
   - Veri kaynaklarına erişim (API çağrıları, veri tabanı işlemleri).
   - Veri transfer objeleri (DTO) ve uzantıları içerir.

2. **Domain**
   - İş mantığı ve uygulama kuralları burada yer alır.
   - Use case'ler ve servisler tanımlanır.

3. **Presentation**
   - Kullanıcı arayüzü (UI) bileşenleri ve kullanıcı etkileşimleri (State management).
   - Görsel mantık burada yönetilir.

---



![IMG_1259 2](https://github.com/user-attachments/assets/cadeed29-4988-46c4-8d6d-f6ee16793c65)
![IMG_1260 2](https://github.com/user-attachments/assets/7ad5f8e5-9716-4dd3-b3d9-3c5cbcc58c7e)
![IMG_1261 2](https://github.com/user-attachments/assets/2ed4fa1e-6fb3-46a2-8539-ba46ffc3306d)
![IMG_1262 2](https://github.com/user-attachments/assets/a27d1d4a-fddd-4e45-9c11-2a81344e8587)



