#include "../libdir/farray.hpp"
# include "gtest/gtest.h"

TEST(FarrayTest, Construction) {
    Farray1D<float> farr_f = Farray1D<float>(24);
    Farray1D<double> farr_d = Farray1D<double>(8);
    Farray1D<int> farr_i = Farray1D<int>(4);
    Farray1D<bool> farr_b = Farray1D<bool>(20);
    Farray1D<char> farr_c = Farray1D<char>(11);

    EXPECT_EQ(farr_f.length(), 24);
    EXPECT_EQ(farr_d.length(), 8);
    EXPECT_EQ(farr_i.length(), 4);
    EXPECT_EQ(farr_b.length(), 20);
    EXPECT_EQ(farr_c.length(), 11);
}

TEST(FarrayTest, CopyConstruction) {
    Farray1D<float> farr_1f = Farray1D<float>(1);
    for (int i=1;i<=farr_1f.length(); i++) {
        farr_1f.set(i, rand());
    }
    Farray1D<float> farr_2f = Farray1D<float>(farr_1f);

    Farray1D<double> farr_1d = Farray1D<double>(2);
    for (int i=1; i<farr_1d.length(); i++) {
        farr_1d.set(i, rand());
    }
    Farray1D<double> farr_2d = Farray1D<double>(farr_1d);

    Farray1D<int> farr_1i = Farray1D<int>(3);
    for (int i=1; i<=farr_1i.length(); i++) {
        farr_1i.set(i, rand());
    }
    Farray1D<int> farr_2i = Farray1D<int>(farr_1i);

    Farray1D<bool> farr_1b = Farray1D<bool>(4);
    for (int i=1; i<=farr_1b.length(); i++) {
        farr_1b.set(i, rand());
    }
    Farray1D<bool> farr_2b = Farray1D<bool>(farr_1b);

    Farray1D<char> farr_1c = Farray1D<char>(5);
    for (int i=1; i<=farr_1c.length(); i++) {
        farr_1c.set(i, rand());
    }
    Farray1D<char> farr_2c = Farray1D<char>(farr_1c);

    EXPECT_EQ(farr_1f.length(), farr_2f.length());
    for (int i=1; i<=farr_1f.length(); i++) {
        EXPECT_FLOAT_EQ(farr_1f.get(i), farr_2f.get(i));
    }
    farr_2f.set(1, 2*farr_2f.get(1));
    EXPECT_NE(farr_1f.get(1), farr_2f.get(1));

    EXPECT_EQ(farr_1d.length(), farr_2d.length());
    for (int i=1; i<=farr_1d.length(); i++) {
        EXPECT_DOUBLE_EQ(farr_1d.get(i), farr_2d.get(i));
    }
    farr_2d.set(1, farr_2d.get(1)/2);
    EXPECT_NE(farr_1d.get(1), farr_2d.get(1));

    EXPECT_EQ(farr_1i.length(), farr_2i.length());
    for (int i=1; i<=farr_1i.length(); i++) {
        EXPECT_EQ(farr_1i.get(i), farr_2i.get(i));
    }
    farr_2i.set(1, farr_2i.get(1)+1);
    EXPECT_NE(farr_1i.get(1), farr_2i.get(1));

    EXPECT_EQ(farr_1b.length(), farr_2b.length());
    for (int i=1; i<=farr_1b.length(); i++) {
        EXPECT_EQ(farr_1b.get(i), farr_2b.get(i));
    }
    farr_2b.set(1, !(farr_2b.get(1)));
    EXPECT_NE(farr_1b.get(1), farr_2b.get(1));

    EXPECT_EQ(farr_1c.length(), farr_2c.length());
    for (int i=1; i<=farr_1c.length(); i++) {
        EXPECT_EQ(farr_1c.get(i), farr_2c.get(i));
    }
    farr_2c.set(1, farr_2c.get(1)+1);
    EXPECT_NE(farr_1c.get(1), farr_2c.get(1));
}

TEST(FarrayTest, ArrayConstruction) {
    float arr_f[6];
    int len_f = sizeof(arr_f)/sizeof(arr_f[0]);
    for (int i=0; i<len_f; i++) {
        arr_f[i] = rand();
    }
    Farray1D<float> farr_f = Farray1D<float>(arr_f, len_f);

    double arr_d[7] = {1, 2};
    int len_d = sizeof(arr_d)/sizeof(arr_d[0]);
    for (int i=0; i<len_d; i++) {
        arr_d[i] = rand();
    }
    Farray1D<double> farr_d = Farray1D<double>(arr_d, len_d);

    int arr_i[8] = {1, 2};
    int len_i = sizeof(arr_i)/sizeof(arr_i[0]);
    for (int i=0; i<len_i; i++) {
        arr_i[i] = rand();
    }
    Farray1D<int> farr_i = Farray1D<int>(arr_i, len_i);

    bool arr_b[9] = {0, 1};
    int len_b = sizeof(arr_b)/sizeof(arr_b[0]);
    for (int i=0; i<len_b; i++) {
        arr_b[i] = rand();
    }
    Farray1D<bool> farr_b = Farray1D<bool>(arr_b, len_b);

    char arr_c[10] = {1, 2};
    int len_c = sizeof(arr_c)/sizeof(arr_c[0]);
    for (int i=0; i<len_c; i++) {
        arr_c[i] = rand();
    }
    Farray1D<char> farr_c = Farray1D<char>(arr_c, len_c);

    EXPECT_EQ(len_f, farr_f.length());
    for (int i=1; i<=len_f; i++) {
        EXPECT_FLOAT_EQ(arr_f[i-1], farr_f.get(i));
    }

    EXPECT_EQ(len_d, farr_d.length());
    for (int i=1; i<=len_d; i++) {
        EXPECT_DOUBLE_EQ(arr_d[i-1], farr_d.get(i));
    }

    EXPECT_EQ(len_i, farr_i.length());
    for (int i=1; i<=len_i; i++) {
        EXPECT_EQ(arr_i[i-1], farr_i.get(i));
    }

    EXPECT_EQ(len_b, farr_b.length());
    for (int i=1; i<=len_b; i++) {
        EXPECT_EQ(arr_b[i-1], farr_b.get(i));
    }

    EXPECT_EQ(len_c, farr_c.length());
    for (int i=1; i<=len_c; i++) {
        EXPECT_EQ(arr_c[i-1], farr_c.get(i));
    }
}
