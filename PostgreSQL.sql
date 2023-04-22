PGDMP         4                {            finalApp    15.1    15.1 :    >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            A           1262    16750    finalApp    DATABASE     ~   CREATE DATABASE "finalApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "finalApp";
                postgres    false            �            1259    16840    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16839    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    217            B           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    216            �            1259    16847    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16846    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    219            C           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    218            �            1259    16854    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16853    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    221            D           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    220            �            1259    16752    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16751    person_id_seq    SEQUENCE     �   ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16861    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16871    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16870    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    225            E           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    16860    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            F           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            �            1259    16910    status    TABLE     Y   CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    16909    status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public          postgres    false    227            G           0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;
          public          postgres    false    226            �           2604    16843    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16850    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16857 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16864 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16874    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16913 	   status id    DEFAULT     f   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            1          0    16840    category 
   TABLE DATA                 public          postgres    false    217   X>       3          0    16847    image 
   TABLE DATA                 public          postgres    false    219   �>       5          0    16854    orders 
   TABLE DATA                 public          postgres    false    221   �B       /          0    16752    person 
   TABLE DATA                 public          postgres    false    215   LD       7          0    16861    product 
   TABLE DATA                 public          postgres    false    223   �F       9          0    16871    product_cart 
   TABLE DATA                 public          postgres    false    225   �L       ;          0    16910    status 
   TABLE DATA                 public          postgres    false    227   �L       H           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    216            I           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 85, true);
          public          postgres    false    218            J           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 10, true);
          public          postgres    false    220            K           0    0    person_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.person_id_seq', 19, true);
          public          postgres    false    214            L           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 16, true);
          public          postgres    false    224            M           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 17, true);
          public          postgres    false    222            N           0    0    status_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.status_id_seq', 4, true);
          public          postgres    false    226            �           2606    16845    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    217            �           2606    16852    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    219            �           2606    16859    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    221            �           2606    16758    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    215            �           2606    16876    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    225            �           2606    16869    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    16915    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    227            �           2606    16878 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    223            �           2606    16884 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    221    3211    215            �           2606    16894 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    217    3213    223            �           2606    16889 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    223    221    3219            �           2606    16879 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    223    219    3219            �           2606    16904 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    3219    225    223            �           2606    16899 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    215    225    3211            1   �   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01�b�Ŧ�.l���b����b녽v\�uaf�̜wa�Qۀ$�..  VG      3   �  x�����\7F{?�t���@�DQB�. v��~�lg��OS�<�������9�?}��������/�?��K��|�����e<]�˷��}�O���?�_^���_����O�w\�.o'�2���)���j�F�	���5^_|}�t)�y�|�@j�f��tz��S�<��fai�r�ӐȔ�zN:F��+�-ɔ5נ쳨_�i�$�܋��ch�<�^o}PΫ��W-�|2 G����rB/g�d1'�s.k�U�r�Ӑ[����^�t�Q�f�)ư���*}�~��z��	f���d裕�ͮ�������������c%L^�?���j������9�sr�8DQ*!�Ʉ�He�9C����Iȼ�	C��	
��6� �<Z�fZ�C����6$RӘ���R^4����e�Y���#y�O��$�
n6��gꖕ��<��G�[Ʈ��-���k��Nl!�Xfç�>Ǒ��z�F�	�j�{�=�da�]��H�c]A����s�$˻V)	���8r��k�C�#�`��z 4���jw}b8̼��܅�zCQsj�^�T�I�O�?'0�-ec�a��G�L¿:5� ��8����4�p2G ���Ŝ̤p,Ԙ��à�L�	�
�59��3�P+��-�ڻ��B'0w��d�sd@���JH�AKɬI�>���;�|I�J�p�4l��!��jg�Ö�:iMŦ��ZHkd�:���:��S���	@�T���bnh/���V���CǙ;�̢b��u�gGȷ}l����2�&~8t��sh�.�~���F�ةk�y�S&���!>��[m��>��:K��~�<Z��8�N`�rh��������1�}z5J�#r�Cަ�;�DݔJi(�SL�J�{���Oc��!]=�G�gd0{�u9�G��2�ǖr}8��o��a���      5   �  x�œ=o1�w�
mN�ごD�t�:d0�@�v�	Hl�|���s��(���HH���}�{z~���vO/��i�o���\�����N��r�;��\^��{��ay�e��iڧ���0/疶���u�9MǼ����������n�uj�Q@Ċ�H2j�-[�f�N�6n�@"l5�	\�.��Hi��c{iG�)����݆�_c`�{F��W,��F-`���+U �9�RBb����U�F�Fr�F��t�,��A(&�-��Sp�|.C��O�9���%����:�m͵`|��KT2��Lb�I����t��n� �С�i�>x񒸘,W�����P}�ɡ$���`�O/��1���	��*��L�)!�B0R�*��оB�.A�9Ԁ�s��b�� �rK�      /   �  x���I��@�{���;e\����%V�.���1&q����F��x+

^��+�p�\�4U�u�c�BM[^�y�8�Y~�XTQ�e�}є'�c�r�^p����kQ޾�x�
��'�۩WMbI�WQx��s�����uB��̄&��b���?�w�&��x]6�~�|������Ȯc(��'u��3ȧ9Y"tQs5; ��WM���8�lH���+�{f��0f�;	9��$������N����=�uÍ[$�Qo���#0v��f
�ʕ]no�{��3�xح`sYW�W@�.3��^y)&�e=7�|�l9�J'7��(l��7r4���c�ա��.��5���:�S?1�Ӓ��2�!ç�
0'�
"�%ĳ���ВT��0�7
x3����gـ0nc,�>��2���t2/�9C+=��%�_jo�\'Z���
�s�Qws��F��9�d2ڊXMl��q�6)c�UW|�A����!vQV�����0�z;�	�*F&�S�N<iX�5����زh�:�8����'M��2�_�%��(�+w���|m��R��^I��>g#)���"�B䡷i�D��iƶF�gk�Ğ >�Y$�Q�Z��Z@y^�d�U\;}t<��+�LFlz�Ck��۳���e���      7   �  x��WKo"G��W�mm	3<��ɒ���^W,�,
1�I|����׶��F%�\"�<�1���(_U5��7{t�k�������*6�w6�z�6��?S{�j�Rb�Q/��j�Z��r�Yy٬~W���~�Q�kV�1�ר���_��*��jV�5<�PlT^��񵄃���/��5���7v�j6���I7O��NZ9�B*[H��|&�8O�V��C=�ghΕ��L�=<ŕ���9׾2z�}����n���g����o�J�uh<|Z��+=�I��3�l�
'���Z�@���	����
���LKw��Ie�
����1|���<j�x�]�a�#'�}�D�
8�oq`b���+�;����a�V������k�M@�;o�V���Jh��҆�?2��'?��vȶ����[e�8�}C �,��8^��&���(�G ">@���bO�������{�EN�_����_�-QZی����=9�Pt@�f�)��p��"�x�D�<�8dN%S��'K�1G?��Imڀ�Q�=)�oQ��t��r�|��VVdo?RH�e�R`�`ыd�V�P��	"J�i-��� ��R�?��X�g���V��,FI)UI������ox�;NS���g+��*-�Ғ�R�Df=�8yv�/��Q�r��ҕ����|BJD� ��f(���>�ڏ-����1F�����b:����G��=���r�س9��?i�G��&�\!�$܌�^ϐ�iű��ǔʜK��
��`�HT�DVp
�������cڇB(�l.Q�?�u�z�6���;{�J��T�|����ϥA9/����Iڟ�A��{D<}�!����I�����^/.Yr`d��Y�8��gH\m>���o�^1�0��>��� ��)���QJ�;A��]���=�4$j��*�=�����$l�\�a�;�4�o�b��qJ=-�J�i�Rܕ����F0c8�|f�*RR�[J�m���V}��?�v%�+����'�+�j�u�$ғ5�|MPQ!��MF V������c(y�4�e��M�`}��Z���3Sma���82b�o��Q�XU��G���|�c']p��L*�^ϲ�s3����1��I��-��d�̨3��d�c.��g�Y���1�o��	�1��m��ŽQ�'�c2�r,��V_��Tk�$�H<��|�m�^��zχ�C��XhI?Nu׿PC1��&��Ì�n:ᬧ���o"쳝6	��bl�b2��9f���=J\�YcVS�	����vʃ�����L[l�@�*j�,9D�)�Dh������*�"���3�4PQ!A+����}���-$�Dv=�v�w�o�P�@�_C"ɅL��_�#<��K,��V��~ɯ�*�G��!��h�\�;D�j��%�����<��i��Y�: ��B�<��FY}Q٭��a�KX|���v��ٱ�e����&i�      9   
   x���          ;   �   x���v
Q���W((M��L�+.I,)-V��L�Q�K�M�Ts�	uV�0�QP�0�bÅ�^�ؤ�i��I�F �]l��hȞ�/l���dC���\�tŖ.l%�&`�\�wa����0Wpq �{e�     