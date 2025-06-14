PGDMP  
    !                }            Airline Flight Booking System    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    82198    Airline Flight Booking System    DATABASE     �   CREATE DATABASE "Airline Flight Booking System" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 /   DROP DATABASE "Airline Flight Booking System";
                     postgres    false            �            1259    82199    airlines    TABLE     �   CREATE TABLE public.airlines (
    airline_id integer NOT NULL,
    airline_name character varying(100),
    country character varying(100),
    iata_code character varying(10)
);
    DROP TABLE public.airlines;
       public         heap r       postgres    false            �            1259    82204    airports    TABLE     �   CREATE TABLE public.airports (
    airport_id integer NOT NULL,
    airport_name character varying(100),
    city character varying(100),
    country character varying(100)
);
    DROP TABLE public.airports;
       public         heap r       postgres    false            �            1259    82234    bookings    TABLE     �   CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    flight_id integer,
    passenger_id integer,
    booking_date timestamp without time zone,
    seat_class character varying(20),
    status character varying(20)
);
    DROP TABLE public.bookings;
       public         heap r       postgres    false            �            1259    82209    flights    TABLE     C  CREATE TABLE public.flights (
    flight_id integer NOT NULL,
    airline_id integer,
    flight_number character varying(20),
    departure_airport_id integer,
    arrival_airport_id integer,
    departure_time timestamp without time zone,
    arrival_time timestamp without time zone,
    status character varying(20)
);
    DROP TABLE public.flights;
       public         heap r       postgres    false            �            1259    82229 
   passengers    TABLE     �   CREATE TABLE public.passengers (
    passenger_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(100),
    phone character varying(20)
);
    DROP TABLE public.passengers;
       public         heap r       postgres    false            �            1259    82249    payments    TABLE     �   CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    booking_id integer,
    payment_date timestamp without time zone,
    amount numeric(10,2),
    payment_method character varying(20)
);
    DROP TABLE public.payments;
       public         heap r       postgres    false            �          0    82199    airlines 
   TABLE DATA           P   COPY public.airlines (airline_id, airline_name, country, iata_code) FROM stdin;
    public               postgres    false    217   �#       �          0    82204    airports 
   TABLE DATA           K   COPY public.airports (airport_id, airport_name, city, country) FROM stdin;
    public               postgres    false    218   �$       �          0    82234    bookings 
   TABLE DATA           i   COPY public.bookings (booking_id, flight_id, passenger_id, booking_date, seat_class, status) FROM stdin;
    public               postgres    false    221   �%       �          0    82209    flights 
   TABLE DATA           �   COPY public.flights (flight_id, airline_id, flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, status) FROM stdin;
    public               postgres    false    219   P&       �          0    82229 
   passengers 
   TABLE DATA           W   COPY public.passengers (passenger_id, first_name, last_name, email, phone) FROM stdin;
    public               postgres    false    220   ^'       �          0    82249    payments 
   TABLE DATA           `   COPY public.payments (payment_id, booking_id, payment_date, amount, payment_method) FROM stdin;
    public               postgres    false    222   N(       5           2606    82203    airlines airlines_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (airline_id);
 @   ALTER TABLE ONLY public.airlines DROP CONSTRAINT airlines_pkey;
       public                 postgres    false    217            7           2606    82208    airports airports_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (airport_id);
 @   ALTER TABLE ONLY public.airports DROP CONSTRAINT airports_pkey;
       public                 postgres    false    218            =           2606    82238    bookings bookings_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);
 @   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_pkey;
       public                 postgres    false    221            9           2606    82213    flights flights_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);
 >   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_pkey;
       public                 postgres    false    219            ;           2606    82233    passengers passengers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);
 D   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_pkey;
       public                 postgres    false    220            ?           2606    82253    payments payments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public                 postgres    false    222            C           2606    82239     bookings bookings_flight_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES public.flights(flight_id);
 J   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_flight_id_fkey;
       public               postgres    false    4665    219    221            D           2606    82244 #   bookings bookings_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES public.passengers(passenger_id);
 M   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_passenger_id_fkey;
       public               postgres    false    4667    221    220            @           2606    82214    flights flights_airline_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_airline_id_fkey FOREIGN KEY (airline_id) REFERENCES public.airlines(airline_id);
 I   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_airline_id_fkey;
       public               postgres    false    217    219    4661            A           2606    82224 '   flights flights_arrival_airport_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_arrival_airport_id_fkey FOREIGN KEY (arrival_airport_id) REFERENCES public.airports(airport_id);
 Q   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_arrival_airport_id_fkey;
       public               postgres    false    219    218    4663            B           2606    82219 )   flights flights_departure_airport_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_departure_airport_id_fkey FOREIGN KEY (departure_airport_id) REFERENCES public.airports(airport_id);
 S   ALTER TABLE ONLY public.flights DROP CONSTRAINT flights_departure_airport_id_fkey;
       public               postgres    false    218    4663    219            E           2606    82254 !   payments payments_booking_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(booking_id);
 K   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_booking_id_fkey;
       public               postgres    false    221    222    4669            �   �   x�EO��@;w��/0���*DD0��e�+N��,k/��K�i;ө%�ۘ�0��64@��N�ثaDC,�8)�^msU�F�_weS2V�>�T��4Fmgn'$;� �wǍp��O���H���,��k�4��\UޖOr�օɽ�,4G����������~[mU�NB:���*�M*      �   �   x�u��N�@���S�	*�?Ǩ�MEB!�J\\e�n�x+���ۓ"u{!k4�y4sȥvʴb���\�Q�����R���d�����#E�u?�s�f�ʻ��u�m�\p��`�c���U�����rF�1�0��f����BU&xi?�O�?eP%�x��Lw\O�# �X�J'����ei\�bpQ�Kei�z����v,>A楡�t�_����߁e�_����f��"�&�E      �   �   x�u��
�0���y�Iүu;*���[�|{S��!%!��PC\�mѵ�p���u\Ӻ��˚��k���<X���s����L��`���4�yfkYZ��V�p,�X��؃=S/��jpǲ�\���4�@�ܳ��v�Ŧb	���u ���n'��5eo�      �   �   x�m��NAEk�W��|=��I�H��	������R��(�{����H�X��g��6�*jٓe�������E�!���zn��p디�(�+^e�k��W����0^��v�<nT�媺c��nZXT�F��J�׳�-�˟���u'>Xק� �ho`h�VYԏ��	:u_�q���#+|O=�O�r����Zi�>��۷�2���[>1���l�^1x��"~��!-��;�aq{�: ���4u��?t]����      �   �   x�u�OO�0����&Z���1�i4Q	���0�d4I�v��$;��c��;k��ep��o��fT_ޢ�ڦ��e���`��WI���V�'/h���^p�PG/���
{v�!��8E�91o����g�!R�$��<�Ɓa�Ք��kj����_8R}&��:~�F��"�o���!��R?���|�5���ɹ��b�g��q�.R͉���ED#<��      �   �   x�e�;
�0��Y>�.���'k.�t1��B��Koߤ1��`��!�6��XG�B�i?D ������z�\�5���A#}�R�Kys%�V�R3� 95d���]iy�B��M�}��gm_��4!k�,���N���vF��S2�+F���EʵO�>&`r��S-��o.}��VC     