
import 'package:spotify_app/models/category.dart';

class CategoryOperation{
  CategoryOperation._(){}
  static List<Category> getcategories(){
 return <Category>[
  
  Category("Lunch Break", "https://f4.bcbits.com/img/a0146120035_10.jpg"),
  Category("Kanye West", "https://preview.redd.it/raptvs-alternate-graduation-album-cover-are-yall-rockin-v0-ntt4vkz9z8ea1.jpg?width=640&crop=smart&auto=webp&s=403260f589e8ce23ae54ac0fc08b49b555945c2a"),
  Category("Jai Shree Ram", "https://i.pinimg.com/originals/65/da/7b/65da7b36212b36e6b98b9266940d37d1.jpg"),
  Category("Eminem","https://upload.wikimedia.org/wikipedia/en/3/35/The_Eminem_Show.jpg"),
  Category("Sigma Male", "https://en.meming.world/images/en/e/e9/Giga_Chad_(alt).jpg"),
  Category("Untitled", "https://images.genius.com/2cff1fff7842521814ffa09e5e16d508.640x640x1.jpg"),
   
 ];

 }

}