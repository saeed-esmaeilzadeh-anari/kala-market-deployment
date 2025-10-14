-- ====================================
-- KALA MARKET E-COMMERCE DATABASE SEED
-- ====================================

-- Clean existing data (in correct order to respect foreign keys)
TRUNCATE TABLE "audit_logs" CASCADE;
TRUNCATE TABLE "notifications" CASCADE;
TRUNCATE TABLE "wishlist_items" CASCADE;
TRUNCATE TABLE "reviews" CASCADE;
TRUNCATE TABLE "payments" CASCADE;
TRUNCATE TABLE "order_items" CASCADE;
TRUNCATE TABLE "orders" CASCADE;
TRUNCATE TABLE "cart_items" CASCADE;
TRUNCATE TABLE "product_variants" CASCADE;
TRUNCATE TABLE "product_images" CASCADE;
TRUNCATE TABLE "products" CASCADE;
TRUNCATE TABLE "brands" CASCADE;
TRUNCATE TABLE "categories" CASCADE;
TRUNCATE TABLE "addresses" CASCADE;
TRUNCATE TABLE "refresh_tokens" CASCADE;
TRUNCATE TABLE "users" CASCADE;
TRUNCATE TABLE "settings" CASCADE;

-- ====================================
-- USERS
-- ====================================

-- Admin Users
INSERT INTO "users" (id, email, phone, "firstName", "lastName", password, role, "isActive", "emailVerified", "phoneVerified", "createdAt", "updatedAt") VALUES
('user-admin-1', 'admin@kalamarket.com', '+989121234567', 'مدیر', 'سیستم', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'SUPER_ADMIN', true, true, true, NOW(), NOW()),
('user-admin-2', 'admin2@kalamarket.com', '+989121234568', 'علی', 'محمدی', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'ADMIN', true, true, true, NOW(), NOW());

-- Seller Users
INSERT INTO "users" (id, email, phone, "firstName", "lastName", password, role, "isActive", "emailVerified", "phoneVerified", "createdAt", "updatedAt") VALUES
('user-seller-1', 'seller1@kalamarket.com', '+989121234569', 'رضا', 'احمدی', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'SELLER', true, true, true, NOW(), NOW()),
('user-seller-2', 'seller2@kalamarket.com', '+989121234570', 'مریم', 'کریمی', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'SELLER', true, true, true, NOW(), NOW());

-- Customer Users
INSERT INTO "users" (id, email, phone, "firstName", "lastName", password, role, "isActive", "emailVerified", "phoneVerified", "createdAt", "updatedAt") VALUES
('user-customer-1', 'customer1@gmail.com', '+989121234571', 'محمد', 'رضایی', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'CUSTOMER', true, true, true, NOW(), NOW()),
('user-customer-2', 'customer2@gmail.com', '+989121234572', 'فاطمه', 'حسینی', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'CUSTOMER', true, true, true, NOW(), NOW()),
('user-customer-3', 'customer3@gmail.com', '+989121234573', 'حسین', 'نوری', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'CUSTOMER', true, true, true, NOW(), NOW()),
('user-customer-4', 'customer4@gmail.com', '+989121234574', 'زهرا', 'مرادی', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'CUSTOMER', true, true, true, NOW(), NOW()),
('user-customer-5', 'customer5@gmail.com', '+989121234575', 'امیر', 'باقری', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.s5uO.G', 'CUSTOMER', true, true, true, NOW(), NOW());

-- Password for all users: Admin@123456

-- ====================================
-- ADDRESSES
-- ====================================

INSERT INTO "addresses" (id, "userId", title, "firstName", "lastName", company, address1, address2, city, state, "postalCode", country, phone, "isDefault", "createdAt", "updatedAt") VALUES
('addr-1', 'user-customer-1', 'منزل', 'محمد', 'رضایی', NULL, 'خیابان آزادی، کوچه شهید رضایی، پلاک 15', 'واحد 3', 'تهران', 'تهران', '1234567890', 'ایران', '+989121234571', true, NOW(), NOW()),
('addr-2', 'user-customer-1', 'محل کار', 'محمد', 'رضایی', 'شرکت فناوری', 'خیابان ولیعصر، برج سپهر، طبقه 10', NULL, 'تهران', 'تهران', '1987654321', 'ایران', '+989121234571', false, NOW(), NOW()),
('addr-3', 'user-customer-2', 'منزل', 'فاطمه', 'حسینی', NULL, 'خیابان انقلاب، کوچه دانش، پلاک 25', NULL, 'مشهد', 'خراسان رضوی', '9876543210', 'ایران', '+989121234572', true, NOW(), NOW()),
('addr-4', 'user-customer-3', 'منزل', 'حسین', 'نوری', NULL, 'خیابان امام خمینی، کوچه نور، پلاک 8', 'واحد 2', 'اصفهان', 'اصفهان', '8765432109', 'ایران', '+989121234573', true, NOW(), NOW()),
('addr-5', 'user-customer-4', 'منزل', 'زهرا', 'مرادی', NULL, 'خیابان شیراز، کوچه گلستان، پلاک 12', NULL, 'شیراز', 'فارس', '7654321098', 'ایران', '+989121234574', true, NOW(), NOW());

-- ====================================
-- CATEGORIES
-- ====================================

-- Main Categories
INSERT INTO "categories" (id, name, slug, description, image, icon, "parentId", "isActive", "sortOrder", "createdAt", "updatedAt") VALUES
('cat-electronics', 'الکترونیک', 'electronics', 'محصولات الکترونیکی و دیجیتال', '/categories/electronics.jpg', 'Smartphone', NULL, true, 1, NOW(), NOW()),
('cat-home-appliances', 'لوازم خانگی', 'home-appliances', 'لوازم خانگی و آشپزخانه', '/categories/home-appliances.jpg', 'Home', NULL, true, 2, NOW(), NOW()),
('cat-computers', 'کامپیوتر و لپ‌تاپ', 'computers-laptops', 'کامپیوتر، لپ‌تاپ و لوازم جانبی', '/categories/computers.jpg', 'Laptop', NULL, true, 3, NOW(), NOW()),
('cat-mobile', 'موبایل و تبلت', 'mobile-tablet', 'گوشی موبایل و تبلت', '/categories/mobile.jpg', 'TabletSmartphone', NULL, true, 4, NOW(), NOW()),
('cat-fashion', 'مد و پوشاک', 'fashion', 'لباس، کفش و اکسسوری', '/categories/fashion.jpg', 'ShoppingBag', NULL, true, 5, NOW(), NOW()),
('cat-books', 'کتاب و لوازم تحریر', 'books-stationery', 'کتاب، لوازم تحریر و هنری', '/categories/books.jpg', 'BookOpen', NULL, true, 6, NOW(), NOW()),
('cat-sports', 'ورزش و سرگرمی', 'sports-entertainment', 'لوازم ورزشی و سرگرمی', '/categories/sports.jpg', 'Dumbbell', NULL, true, 7, NOW(), NOW()),
('cat-beauty', 'زیبایی و سلامت', 'beauty-health', 'محصولات زیبایی و بهداشتی', '/categories/beauty.jpg', 'Heart', NULL, true, 8, NOW(), NOW());

-- Sub Categories - Mobile
INSERT INTO "categories" (id, name, slug, description, image, icon, "parentId", "isActive", "sortOrder", "createdAt", "updatedAt") VALUES
('cat-mobile-phones', 'گوشی موبایل', 'mobile-phones', 'انواع گوشی موبایل', NULL, NULL, 'cat-mobile', true, 1, NOW(), NOW()),
('cat-tablets', 'تبلت', 'tablets', 'انواع تبلت', NULL, NULL, 'cat-mobile', true, 2, NOW(), NOW()),
('cat-mobile-accessories', 'لوازم جانبی موبایل', 'mobile-accessories', 'کاور، شارژر، هندزفری', NULL, NULL, 'cat-mobile', true, 3, NOW(), NOW()),
('cat-smartwatches', 'ساعت هوشمند', 'smartwatches', 'ساعت‌های هوشمند و مچ‌بند', NULL, NULL, 'cat-mobile', true, 4, NOW(), NOW());

-- Sub Categories - Computers
INSERT INTO "categories" (id, name, slug, description, image, icon, "parentId", "isActive", "sortOrder", "createdAt", "updatedAt") VALUES
('cat-laptops', 'لپ‌تاپ', 'laptops', 'انواع لپ‌تاپ', NULL, NULL, 'cat-computers', true, 1, NOW(), NOW()),
('cat-desktops', 'کامپیوتر رومیزی', 'desktop-computers', 'کامپیوتر دسکتاپ', NULL, NULL, 'cat-computers', true, 2, NOW(), NOW()),
('cat-monitors', 'مانیتور', 'monitors', 'مانیتورهای کامپیوتر', NULL, NULL, 'cat-computers', true, 3, NOW(), NOW()),
('cat-computer-accessories', 'لوازم جانبی کامپیوتر', 'computer-accessories', 'ماوس، کیبورد، هدست', NULL, NULL, 'cat-computers', true, 4, NOW(), NOW());

-- Sub Categories - Home Appliances
INSERT INTO "categories" (id, name, slug, description, image, icon, "parentId", "isActive", "sortOrder", "createdAt", "updatedAt") VALUES
('cat-refrigerators', 'یخچال و فریزر', 'refrigerators', 'یخچال و فریزر', NULL, NULL, 'cat-home-appliances', true, 1, NOW(), NOW()),
('cat-washing-machines', 'ماشین لباسشویی', 'washing-machines', 'ماشین لباسشویی', NULL, NULL, 'cat-home-appliances', true, 2, NOW(), NOW()),
('cat-gas-stoves', 'اجاق گاز', 'gas-stoves', 'اجاق گاز', NULL, NULL, 'cat-home-appliances', true, 3, NOW(), NOW()),
('cat-kitchen-appliances', 'لوازم آشپزخانه', 'kitchen-appliances', 'توستر، اسپرسو، غذاساز', NULL, NULL, 'cat-home-appliances', true, 4, NOW(), NOW()),
('cat-vacuum-cleaners', 'جاروبرقی', 'vacuum-cleaners', 'جاروبرقی و بخارشوی', NULL, NULL, 'cat-home-appliances', true, 5, NOW(), NOW());

-- ====================================
-- BRANDS
-- ====================================

INSERT INTO "brands" (id, name, slug, description, logo, website, "isActive", "createdAt", "updatedAt") VALUES
('brand-samsung', 'سامسونگ', 'samsung', 'برند کره‌ای سامسونگ، تولیدکننده الکترونیک', '/brands/samsung.png', 'https://www.samsung.com', true, NOW(), NOW()),
('brand-apple', 'اپل', 'apple', 'شرکت آمریکایی اپل', '/brands/apple.png', 'https://www.apple.com', true, NOW(), NOW()),
('brand-xiaomi', 'شیائومی', 'xiaomi', 'برند چینی شیائومی', '/brands/xiaomi.png', 'https://www.mi.com', true, NOW(), NOW()),
('brand-huawei', 'هوآوی', 'huawei', 'برند چینی هوآوی', '/brands/huawei.png', 'https://www.huawei.com', true, NOW(), NOW()),
('brand-lg', 'ال جی', 'lg', 'برند کره‌ای ال جی', '/brands/lg.png', 'https://www.lg.com', true, NOW(), NOW()),
('brand-sony', 'سونی', 'sony', 'برند ژاپنی سونی', '/brands/sony.png', 'https://www.sony.com', true, NOW(), NOW()),
('brand-dell', 'دل', 'dell', 'برند آمریکایی دل', '/brands/dell.png', 'https://www.dell.com', true, NOW(), NOW()),
('brand-hp', 'اچ پی', 'hp', 'برند آمریکایی اچ پی', '/brands/hp.png', 'https://www.hp.com', true, NOW(), NOW()),
('brand-asus', 'ایسوس', 'asus', 'برند تایوانی ایسوس', '/brands/asus.png', 'https://www.asus.com', true, NOW(), NOW()),
('brand-lenovo', 'لنوو', 'lenovo', 'برند چینی لنوو', '/brands/lenovo.png', 'https://www.lenovo.com', true, NOW(), NOW()),
('brand-lopez', 'لوپز', 'lopez', 'برند ایرانی لوپز', '/brands/lopez.png', NULL, true, NOW(), NOW()),
('brand-chuwi', 'چووی', 'chuwi', 'برند چینی چووی', '/brands/chuwi.png', 'https://www.chuwi.com', true, NOW(), NOW()),
('brand-sunward', 'سان‌وارد', 'sunward', 'برند ایرانی سان‌وارد', '/brands/sunward.png', NULL, true, NOW(), NOW()),
('brand-mabashi', 'مباشی', 'mabashi', 'برند ایرانی مباشی', '/brands/mabashi.png', NULL, true, NOW(), NOW()),
('brand-donar', 'دونار', 'donar', 'برند ایرانی دونار', '/brands/donar.png', NULL, true, NOW(), NOW()),
('brand-bosch', 'بوش', 'bosch', 'برند آلمانی بوش', '/brands/bosch.png', 'https://www.bosch.com', true, NOW(), NOW()),
('brand-philips', 'فیلیپس', 'philips', 'برند هلندی فیلیپس', '/brands/philips.png', 'https://www.philips.com', true, NOW(), NOW());

-- ====================================
-- PRODUCTS
-- ====================================

-- Mobile Phones
INSERT INTO "products" (id, name, slug, description, "shortDescription", sku, barcode, price, "comparePrice", "costPrice", "trackQuantity", quantity, "lowStockThreshold", weight, dimensions, "metaTitle", "metaDescription", "isActive", "isFeatured", "isDigital", "categoryId", "brandId", "createdAt", "updatedAt") VALUES
('prod-samsung-s23', 'گوشی موبایل سامسونگ مدل Galaxy S23 Ultra', 'samsung-galaxy-s23-ultra', 
'گوشی سامسونگ گلکسی S23 اولترا با صفحه نمایش 6.8 اینچی Dynamic AMOLED 2X، دوربین 200 مگاپیکسلی و پردازنده Snapdragon 8 Gen 2 یکی از قدرتمندترین گوشی‌های هوشمند بازار است. این گوشی با باتری 5000 میلی‌آمپر ساعت و شارژ سریع 45 واتی، تجربه استفاده بی‌نظیری را برای کاربران فراهم می‌کند.',
'گوشی هوشمند پرچمدار سامسونگ با دوربین 200MP',
'SAM-S23U-512-BLK', '8801643942953', 55990000, 59990000, 48000000, true, 25, 5, 234, '{"length": 163.4, "width": 78.1, "height": 8.9}',
'خرید گوشی سامسونگ Galaxy S23 Ultra | کالا مارکت',
'گوشی موبایل سامسونگ Galaxy S23 Ultra با بهترین قیمت و گارانتی معتبر از کالا مارکت',
true, true, false, 'cat-mobile-phones', 'brand-samsung', NOW(), NOW()),

('prod-iphone-15-pro', 'گوشی موبایل اپل مدل iPhone 15 Pro Max', 'apple-iphone-15-pro-max',
'آیفون 15 پرو مکس با تراشه A17 Pro، دوربین پریسکوپی 5x و بدنه تیتانیوم، نماینده اوج فناوری اپل است. صفحه نمایش Super Retina XDR 6.7 اینچی و قابلیت Dynamic Island تجربه کاربری منحصربه‌فردی را ارائه می‌دهد.',
'جدیدترین آیفون با تراشه A17 Pro و بدنه تیتانیوم',
'APL-IP15PM-256-NAT', '194253406891', 68990000, 72990000, 61000000, true, 15, 3, 221, '{"length": 159.9, "width": 76.7, "height": 8.25}',
'خرید iPhone 15 Pro Max | قیمت آیفون 15 پرو مکس',
'آیفون 15 پرو مکس اپل با بهترین قیمت و گارانتی اپل از کالا مارکت',
true, true, false, 'cat-mobile-phones', 'brand-apple', NOW(), NOW()),

('prod-xiaomi-13-pro', 'گوشی موبایل شیائومی مدل 13 Pro', 'xiaomi-13-pro',
'شیائومی 13 پرو با همکاری Leica، دوربینی حرفه‌ای با سنسور Sony IMX989 یک اینچی ارائه می‌دهد. پردازنده Snapdragon 8 Gen 2 و نمایشگر AMOLED 120Hz این گوشی را به انتخابی عالی برای علاقه‌مندان به عکاسی تبدیل کرده است.',
'گوشی پرچمدار شیائومی با دوربین Leica',
'XIA-13P-256-BLK', '6934177782121', 38990000, 42990000, 34000000, true, 30, 5, 229, '{"length": 162.9, "width": 74.6, "height": 8.38}',
'خرید Xiaomi 13 Pro | قیمت شیائومی 13 پرو',
'گوشی شیائومی 13 پرو با دوربین Leica و بهترین قیمت از کالا مارکت',
true, true, false, 'cat-mobile-phones', 'brand-xiaomi', NOW(), NOW()),

-- Laptops
('prod-macbook-pro-16', 'لپ تاپ اپل مدل MacBook Pro 16 M3 Pro', 'apple-macbook-pro-16-m3-pro',
'مک‌بوک پرو 16 اینچ با تراشه M3 Pro قدرتمندترین لپ‌تاپ اپل برای حرفه‌ای‌هاست. با 18GB RAM یکپارچه، GPU 18 هسته‌ای و نمایشگر Liquid Retina XDR، این لپ‌تاپ برای کارهای سنگین گرافیکی و ویرایش ویدئو طراحی شده است.',
'لپ‌تاپ حرفه‌ای اپل با تراشه M3 Pro',
'APL-MBP16-M3P-18-512', '195949038853', 118990000, 125990000, 105000000, true, 8, 2, 2160, '{"length": 355.7, "width": 248.1, "height": 16.8}',
'خرید MacBook Pro 16 M3 Pro | قیمت مکبوک پرو 16',
'لپ تاپ اپل مک‌بوک پرو 16 اینچ M3 Pro با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-laptops', 'brand-apple', NOW(), NOW()),

('prod-dell-xps-15', 'لپ تاپ دل مدل XPS 15 9530', 'dell-xps-15-9530',
'Dell XPS 15 با پردازنده Intel Core i7 نسل 13، کارت گرافیک NVIDIA RTX 4060 و نمایشگر 3.5K OLED، ترکیبی عالی از قدرت و زیبایی است. این لپ‌تاپ با بدنه آلومینیومی و صفحه کلید بک‌لایت، برای کاربران حرفه‌ای طراحی شده است.',
'لپ‌تاپ پرقدرت دل با نمایشگر OLED',
'DELL-XPS15-I7-32-1TB', '884116458562', 89990000, 94990000, 79000000, true, 12, 3, 1920, '{"length": 344.7, "width": 230.1, "height": 18}',
'خرید Dell XPS 15 | قیمت لپ تاپ دل ایکس پی اس 15',
'لپ تاپ Dell XPS 15 9530 با بهترین قیمت و گارانتی از کالا مارکت',
true, true, false, 'cat-laptops', 'brand-dell', NOW(), NOW()),

('prod-chuwi-ultrabook-14', 'لپ تاپ چووی مدل UltraBook Pro 14', 'chuwi-ultrabook-pro-14',
'لپ‌تاپ چووی UltraBook Pro 14 با پردازنده Intel Celeron N5100، 8GB RAM و حافظه 256GB SSD، گزینه‌ای مقرون به صرفه برای کارهای روزمره و تحصیلی است. این لپ‌تاپ با وزن تنها 1.3 کیلوگرم بسیار سبک و قابل حمل است.',
'لپ‌تاپ ارزان و سبک برای استفاده روزمره',
'CHU-UBP14-8-256', '6971246982012', 12500000, 14500000, 10500000, true, 20, 5, 1300, '{"length": 320, "width": 208, "height": 18}',
'خرید Chuwi UltraBook Pro 14 | لپ تاپ چووی',
'لپ تاپ چووی UltraBook Pro 14 با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-laptops', 'brand-chuwi', NOW(), NOW()),

-- Home Appliances
('prod-samsung-fridge', 'یخچال فریزر سامسونگ مدل RT62', 'samsung-refrigerator-rt62',
'یخچال فریزر سامسونگ RT62 با ظرفیت 620 لیتر، فناوری No Frost و قفسه‌های شیشه‌ای ضد شکست، انتخابی مناسب برای خانواده‌های بزرگ است. این یخچال با کلاس انرژی A+ مصرف برق بهینه‌ای دارد.',
'یخچال فریزر بزرگ سامسونگ با فناوری No Frost',
'SAM-RF620-SLV', '8806094058123', 45990000, 49990000, 40000000, true, 15, 3, 82000, '{"length": 912, "width": 790, "height": 1780}',
'خرید یخچال سامسونگ RT62 | قیمت یخچال فریزر سامسونگ',
'یخچال فریزر سامسونگ RT62 با بهترین قیمت و گارانتی از کالا مارکت',
true, true, false, 'cat-refrigerators', 'brand-samsung', NOW(), NOW()),

('prod-donar-fridge', 'یخچال فریزر دونار مدل Twin Plus', 'donar-twin-refrigerator',
'یخچال فریزر دونار Twin Plus با ظرفیت 28 فوت، سیستم خنک کننده دوگانه و فناوری هوای سرد، انتخابی عالی برای خانواده‌های ایرانی است. این یخچال با طراحی مدرن و رنگ استیل، زیبایی آشپزخانه شما را دو چندان می‌کند.',
'یخچال فریزر ایرانی با کیفیت عالی',
'DON-TWIN-28-STL', '6260011234567', 28990000, 31990000, 25000000, true, 25, 5, 75000, '{"length": 850, "width": 750, "height": 1750}',
'خرید یخچال دونار Twin Plus | قیمت یخچال دونار',
'یخچال فریزر دونار Twin Plus با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-refrigerators', 'brand-donar', NOW(), NOW()),

('prod-lopez-gas-stove', 'اجاق گاز لوپز مدل Standard Plus', 'lopez-gas-stove-standard',
'اجاق گاز لوپز Standard Plus با 4 شعله و صفحه استیل ضدزنگ، استانداردهای ایمنی اروپا را دارد. این اجاق گاز با سیستم احتراق کامل و مشعل‌های ایتالیایی، بهترین انتخاب برای آشپزخانه‌های ایرانی است.',
'اجاق گاز 4 شعله با کیفیت بالا',
'LOP-STD4-WHT', '6280012345678', 8500000, 9500000, 7200000, true, 30, 5, 25000, '{"length": 600, "width": 600, "height": 95}',
'خرید اجاق گاز لوپز Standard | قیمت اجاق گاز لوپز',
'اجاق گاز لوپز Standard Plus با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-gas-stoves', 'brand-lopez', NOW(), NOW()),

('prod-lopez-premium-stove', 'اجاق گاز لوپز مدل Premium 10000S', 'lopez-gas-stove-10000s',
'اجاق گاز لوپز Premium 10000S با 5 شعله شامل یک شعله سوپر، صفحه شیشه ای مقاوم و سیستم ایمنی FFD، مدل پرمیوم لوپز است. این اجاق گاز با طراحی مدرن و امکانات پیشرفته، برای آشپزخانه‌های لوکس طراحی شده است.',
'اجاق گاز پرمیوم 5 شعله لوپز',
'LOP-PREM5-10000S', '6280012345789', 15990000, 17990000, 13500000, true, 18, 3, 28000, '{"length": 900, "width": 600, "height": 95}',
'خرید اجاق گاز لوپز Premium 10000S | قیمت اجاق گاز 5 شعله',
'اجاق گاز لوپز Premium 10000S با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-gas-stoves', 'brand-lopez', NOW(), NOW()),

('prod-sunward-toaster', 'توستر برقی سان‌وارد مدل SWF-40R', 'sunward-swf-40r-toaster',
'توستر برقی سان‌وارد SWF-40R با ظرفیت 40 لیتر، 5 عملکرد مختلف پخت و تایمر دیجیتال، ابزاری کاربردی برای آشپزخانه است. این توستر با قدرت 1800 وات و درب دوجداره، ایمنی و سرعت پخت بالایی دارد.',
'توستر 40 لیتری با امکانات کامل',
'SUN-TWF40R-BLK', '6290123456789', 4990000, 5490000, 4200000, true, 35, 8, 8500, '{"length": 550, "width": 420, "height": 350}',
'خرید توستر سان‌وارد SWF-40R | قیمت توستر برقی',
'توستر برقی سان‌وارد SWF-40R با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-kitchen-appliances', 'brand-sunward', NOW(), NOW()),

('prod-mabashi-espresso', 'اسپرسو ساز مباشی مدل ECM2013', 'mabashi-ecm2013-espresso',
'اسپرسو ساز مباشی ECM2013 با فشار 15 بار، ظرفیت مخزن 1.5 لیتر و شیر فوم ساز، قهوه‌ای حرفه‌ای در خانه آماده می‌کند. این دستگاه با بدنه استیل ضد زنگ و صفحه گرم کن فنجان، دارای طراحی زیبا و کاربردی است.',
'دستگاه اسپرسو ساز حرفه‌ای خانگی',
'MAB-ECM2013-SLV', '6291234567890', 7890000, 8490000, 6800000, true, 22, 5, 4200, '{"length": 320, "width": 280, "height": 360}',
'خرید اسپرسو ساز مباشی ECM2013 | قیمت قهوه ساز',
'اسپرسو ساز مباشی ECM2013 با بهترین قیمت از کالا مارکت',
true, true, false, 'cat-kitchen-appliances', 'brand-mabashi', NOW(), NOW()),

-- Cameras
('prod-samsung-camera', 'دوربین دیجیتال سامسونگ مدل ST150F', 'samsung-st150f-camera',
'دوربین دیجیتال کامپکت سامسونگ ST150F با 16.2 مگاپیکسل، زوم اپتیکال 5x و Wi-Fi داخلی برای اشتراک‌گذاری آسان عکس‌ها. این دوربین با صفحه نمایش 3 اینچی و قابلیت فیلم‌برداری HD، مناسب عکاسان آماتور است.',
'دوربین کامپکت با Wi-Fi و زوم 5x',
'SAM-ST150F-RED', '8806085667723', 5990000, 6490000, 5200000, true, 18, 4, 185, '{"length": 95.2, "width": 56, "height": 19.5}',
'خرید دوربین سامسونگ ST150F | قیمت دوربین دیجیتال',
'دوربین دیجیتال سامسونگ ST150F با بهترین قیمت از کالا مارکت',
true, false, false, 'cat-electronics', 'brand-samsung', NOW(), NOW());

-- ====================================
-- PRODUCT IMAGES
-- ====================================

-- Samsung S23 Ultra
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-s23-1', 'prod-samsung-s23', '/samsung-galaxy-s23-ultra.png', 'سامسونگ گلکسی S23 Ultra', 0, NOW()),
('img-s23-2', 'prod-samsung-s23', '/samsung-s23-back.jpg', 'نمای پشت سامسونگ S23', 1, NOW()),
('img-s23-3', 'prod-samsung-s23', '/samsung-s23-camera.jpg', 'دوربین سامسونگ S23', 2, NOW()),
('img-s23-4', 'prod-samsung-s23', '/samsung-s23-screen.jpg', 'صفحه نمایش S23', 3, NOW());

-- iPhone 15 Pro Max
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-ip15-1', 'prod-iphone-15-pro', '/iphone-15-pro-max.jpg', 'آیفون 15 پرو مکس', 0, NOW()),
('img-ip15-2', 'prod-iphone-15-pro', '/iphone-15-pro-titanium.jpg', 'بدنه تیتانیوم آیفون 15', 1, NOW()),
('img-ip15-3', 'prod-iphone-15-pro', '/iphone-15-pro-camera.jpg', 'دوربین آیفون 15 پرو', 2, NOW());

-- Xiaomi 13 Pro
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-xia13-1', 'prod-xiaomi-13-pro', '/xiaomi-13-pro.jpg', 'شیائومی 13 پرو', 0, NOW()),
('img-xia13-2', 'prod-xiaomi-13-pro', '/xiaomi-13-pro-leica.jpg', 'دوربین Leica شیائومی', 1, NOW());

-- MacBook Pro 16
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-mbp-1', 'prod-macbook-pro-16', '/macbook-pro-16-m3.jpg', 'مک‌بوک پرو 16 اینچ', 0, NOW()),
('img-mbp-2', 'prod-macbook-pro-16', '/macbook-pro-16-display.jpg', 'نمایشگر مک‌بوک پرو', 1, NOW());

-- Dell XPS 15
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-xps-1', 'prod-dell-xps-15', '/dell-xps-15.jpg', 'دل XPS 15', 0, NOW()),
('img-xps-2', 'prod-dell-xps-15', '/dell-xps-15-oled.jpg', 'نمایشگر OLED دل XPS', 1, NOW());

-- Chuwi UltraBook
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-chu-1', 'prod-chuwi-ultrabook-14', '/chuwi-ultrabook-14-pro.png', 'چووی UltraBook Pro 14', 0, NOW());

-- Samsung Fridge
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-fridge-1', 'prod-samsung-fridge', '/samsung-fridge-rt62.jpg', 'یخچال سامسونگ RT62', 0, NOW());

-- Donar Fridge
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-donar-1', 'prod-donar-fridge', '/donar-twin-refrigerator.png', 'یخچال دونار Twin Plus', 0, NOW());

-- Lopez Gas Stove Standard
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-lopez-1', 'prod-lopez-gas-stove', '/lopez-gas-stove.png', 'اجاق گاز لوپز استاندارد', 0, NOW());

-- Lopez Premium
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-lopez-p-1', 'prod-lopez-premium-stove', '/lopez-gas-stove-10000s.png', 'اجاق گاز لوپز Premium', 0, NOW());

-- Sunward Toaster
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-sun-1', 'prod-sunward-toaster', '/sunward-swf-40r-toaster-oven.png', 'توستر سان‌وارد SWF-40R', 0, NOW());

-- Mabashi Espresso
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-mab-1', 'prod-mabashi-espresso', '/mabashi-ecm2013-espresso-maker.png', 'اسپرسو ساز مباشی ECM2013', 0, NOW());

-- Samsung Camera
INSERT INTO "product_images" (id, "productId", url, alt, "sortOrder", "createdAt") VALUES
('img-cam-1', 'prod-samsung-camera', '/samsung-st150f.png', 'دوربین سامسونگ ST150F', 0, NOW());

-- ====================================
-- PRODUCT VARIANTS
-- ====================================

-- Samsung S23 Ultra Variants
INSERT INTO "product_variants" (id, "productId", name, sku, price, quantity, attributes, "createdAt", "updatedAt") VALUES
('var-s23-512-black', 'prod-samsung-s23', 'سامسونگ S23 Ultra 512GB مشکی', 'SAM-S23U-512-BLK', 55990000, 25, '{"storage": "512GB", "color": "مشکی"}', NOW(), NOW()),
('var-s23-512-green', 'prod-samsung-s23', 'سامسونگ S23 Ultra 512GB سبز', 'SAM-S23U-512-GRN', 55990000, 18, '{"storage": "512GB", "color": "سبز"}', NOW(), NOW()),
('var-s23-256-black', 'prod-samsung-s23', 'سامسونگ S23 Ultra 256GB مشکی', 'SAM-S23U-256-BLK', 49990000, 30, '{"storage": "256GB", "color": "مشکی"}', NOW(), NOW());

-- iPhone 15 Pro Max Variants
INSERT INTO "product_variants" (id, "productId", name, sku, price, quantity, attributes, "createdAt", "updatedAt") VALUES
('var-ip15-256-natural', 'prod-iphone-15-pro', 'iPhone 15 Pro Max 256GB تیتانیوم طبیعی', 'APL-IP15PM-256-NAT', 68990000, 15, '{"storage": "256GB", "color": "تیتانیوم طبیعی"}', NOW(), NOW()),
('var-ip15-256-blue', 'prod-iphone-15-pro', 'iPhone 15 Pro Max 256GB تیتانیوم آبی', 'APL-IP15PM-256-BLU', 68990000, 12, '{"storage": "256GB", "color": "تیتانیوم آبی"}', NOW(), NOW()),
('var-ip15-512-natural', 'prod-iphone-15-pro', 'iPhone 15 Pro Max 512GB تیتانیوم طبیعی', 'APL-IP15PM-512-NAT', 79990000, 8, '{"storage": "512GB", "color": "تیتانیوم طبیعی"}', NOW(), NOW());

-- ====================================
-- REVIEWS
-- ====================================

INSERT INTO "reviews" (id, "userId", "productId", rating, title, comment, "isVerified", "isApproved", "createdAt", "updatedAt") VALUES
('rev-1', 'user-customer-1', 'prod-samsung-s23', 5, 'عالی', 'گوشی فوق‌العاده‌ای است. دوربین و عملکردش بی‌نظیره', true, true, NOW(), NOW()),
('rev-2', 'user-customer-2', 'prod-samsung-s23', 4, 'خوب', 'گوشی خوبی است ولی قیمتش بالاست', true, true, NOW(), NOW()),
('rev-3', 'user-customer-3', 'prod-iphone-15-pro', 5, 'بهترین آیفون', 'تراشه A17 Pro واقعا قدرتمنده. باتری هم خوبه', true, true, NOW(), NOW()),
('rev-4', 'user-customer-4', 'prod-xiaomi-13-pro', 5, 'دوربین عالی', 'دوربین Leica واقعا کیفیت عکس رو بالا برده', true, true, NOW(), NOW()),
('rev-5', 'user-customer-1', 'prod-macbook-pro-16', 5, 'قدرتمند', 'برای کارهای گرافیکی عالیه. M3 Pro فوق‌العادست', true, true, NOW(), NOW()),
('rev-6', 'user-customer-5', 'prod-lopez-gas-stove', 4, 'کیفیت خوب', 'اجاق گاز با کیفیتی با قیمت مناسب', true, true, NOW(), NOW()),
('rev-7', 'user-customer-2', 'prod-donar-fridge', 5, 'یخچال عالی', 'خنک کنندگی فوق‌العاده‌ای داره و صدا هم نداره', true, true, NOW(), NOW());

-- ====================================
-- ORDERS
-- ====================================

INSERT INTO "orders" (id, "orderNumber", "userId", status, subtotal, "taxAmount", "shippingAmount", "discountAmount", "totalAmount", "shippingAddressId", "shippingMethod", "trackingNumber", "paymentStatus", "paymentMethod", "orderDate", "shippedAt", "deliveredAt", "createdAt", "updatedAt") VALUES
('order-1', 'ORD-20240101-001', 'user-customer-1', 'DELIVERED', 55990000, 5040000, 50000, 0, 61080000, 'addr-1', 'پست پیشتاز', 'IR1234567890', 'COMPLETED', 'CREDIT_CARD', '2024-01-01 10:00:00', '2024-01-02 14:00:00', '2024-01-05 16:30:00', NOW(), NOW()),
('order-2', 'ORD-20240102-002', 'user-customer-2', 'DELIVERED', 45990000, 4140000, 50000, 500000, 49680000, 'addr-3', 'پست معمولی', 'IR2234567891', 'COMPLETED', 'BANK_TRANSFER', '2024-01-02 11:30:00', '2024-01-03 09:00:00', '2024-01-08 11:00:00', NOW(), NOW()),
('order-3', 'ORD-20240105-003', 'user-customer-3', 'SHIPPED', 68990000, 6210000, 50000, 0, 75250000, 'addr-4', 'پست پیشتاز', 'IR3234567892', 'COMPLETED', 'WALLET', '2024-01-05 15:00:00', '2024-01-06 10:00:00', NULL, NOW(), NOW()),
('order-4', 'ORD-20240107-004', 'user-customer-4', 'PROCESSING', 28990000, 2610000, 50000, 0, 31650000, 'addr-5', 'پیک فروشگاه', NULL, 'PENDING', 'CASH_ON_DELIVERY', '2024-01-07 13:00:00', NULL, NULL, NOW(), NOW());

-- ====================================
-- ORDER ITEMS
-- ====================================

INSERT INTO "order_items" (id, "orderId", "productId", quantity, price, "totalPrice", "createdAt") VALUES
('oi-1', 'order-1', 'prod-samsung-s23', 1, 55990000, 55990000, NOW()),
('oi-2', 'order-2', 'prod-samsung-fridge', 1, 45990000, 45990000, NOW()),
('oi-3', 'order-3', 'prod-iphone-15-pro', 1, 68990000, 68990000, NOW()),
('oi-4', 'order-4', 'prod-donar-fridge', 1, 28990000, 28990000, NOW());

-- ====================================
-- PAYMENTS
-- ====================================

INSERT INTO "payments" (id, "orderId", amount, method, status, "transactionId", "gatewayResponse", "createdAt", "updatedAt") VALUES
('pay-1', 'order-1', 61080000, 'CREDIT_CARD', 'COMPLETED', 'TXN-1234567890', '{"status": "success", "refId": "REF123456"}', NOW(), NOW()),
('pay-2', 'order-2', 49680000, 'BANK_TRANSFER', 'COMPLETED', 'TXN-2234567891', '{"status": "success", "refId": "REF123457"}', NOW(), NOW()),
('pay-3', 'order-3', 75250000, 'WALLET', 'COMPLETED', 'TXN-3234567892', '{"status": "success", "refId": "REF123458"}', NOW(), NOW());

-- ====================================
-- WISHLIST
-- ====================================

INSERT INTO "wishlist_items" (id, "userId", "productId", "createdAt") VALUES
('wish-1', 'user-customer-1', 'prod-iphone-15-pro', NOW()),
('wish-2', 'user-customer-1', 'prod-macbook-pro-16', NOW()),
('wish-3', 'user-customer-2', 'prod-xiaomi-13-pro', NOW()),
('wish-4', 'user-customer-3', 'prod-dell-xps-15', NOW()),
('wish-5', 'user-customer-4', 'prod-samsung-s23', NOW()),
('wish-6', 'user-customer-5', 'prod-lopez-premium-stove', NOW());

-- ====================================
-- CART ITEMS
-- ====================================

INSERT INTO "cart_items" (id, "userId", "productId", quantity, "createdAt", "updatedAt") VALUES
('cart-1', 'user-customer-1', 'prod-xiaomi-13-pro', 1, NOW(), NOW()),
('cart-2', 'user-customer-2', 'prod-lopez-gas-stove', 1, NOW(), NOW()),
('cart-3', 'user-customer-3', 'prod-sunward-toaster', 2, NOW(), NOW());

-- ====================================
-- NOTIFICATIONS
-- ====================================

INSERT INTO "notifications" (id, "userId", title, message, type, "isRead", data, "createdAt") VALUES
('notif-1', 'user-customer-1', 'سفارش شما ارسال شد', 'سفارش شماره ORD-20240101-001 ارسال شد و به زودی تحویل می‌شود', 'push', true, '{"orderId": "order-1"}', NOW()),
('notif-2', 'user-customer-2', 'سفارش شما تحویل داده شد', 'سفارش شماره ORD-20240102-002 با موفقیت تحویل داده شد', 'email', true, '{"orderId": "order-2"}', NOW()),
('notif-3', 'user-customer-3', 'سفارش شما در حال ارسال است', 'سفارش شماره ORD-20240105-003 در حال ارسال است', 'sms', false, '{"orderId": "order-3"}', NOW()),
('notif-4', 'user-customer-4', 'سفارش شما در حال پردازش است', 'سفارش شماره ORD-20240107-004 در حال پردازش است', 'push', false, '{"orderId": "order-4"}', NOW());

-- ====================================
-- SETTINGS
-- ====================================

INSERT INTO "settings" (id, key, value, description, "createdAt", "updatedAt") VALUES
('set-1', 'site_name', '"کالا مارکت"', 'نام سایت', NOW(), NOW()),
('set-2', 'site_description', '"فروشگاه اینترنتی کالا مارکت - خرید آسان و ارزان"', 'توضیحات سایت', NOW(), NOW()),
('set-3', 'contact_email', '"info@kalamarket.com"', 'ایمیل تماس', NOW(), NOW()),
('set-4', 'contact_phone', '"+982191234567"', 'تلفن تماس', NOW(), NOW()),
('set-5', 'tax_rate', '0.09', 'نرخ مالیات (9%)', NOW(), NOW()),
('set-6', 'currency', '"IRR"', 'واحد پولی', NOW(), NOW()),
('set-7', 'shipping_cost', '50000', 'هزینه ارسال پایه', NOW(), NOW()),
('set-8', 'free_shipping_threshold', '1000000', 'حداقل مبلغ برای ارسال رایگان', NOW(), NOW()),
('set-9', 'max_cart_items', '50', 'حداکثر تعداد کالا در سبد', NOW(), NOW()),
('set-10', 'order_timeout', '30', 'مهلت پرداخت سفارش (دقیقه)', NOW(), NOW());

-- ====================================
-- Success Message
-- ====================================

DO $$
BEGIN
    RAISE NOTICE 'Database seeded successfully!';
    RAISE NOTICE 'Admin credentials:';
    RAISE NOTICE '  Email: admin@kalamarket.com';
    RAISE NOTICE '  Password: Admin@123456';
END $$;
