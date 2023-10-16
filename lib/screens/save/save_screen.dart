import 'package:flutter/material.dart';
import '../../components/header.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Header(textHeader: 'Saved recipes'),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SpecialOfferCard(
                    category: 'Food',
                    image: 'assets/images/food_horizontal.jpg',
                    numOfBrands: 18,
                    press: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          SizedBox(
            width: 350,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF343434).withOpacity(0.4),
                          const Color(0xFF343434).withOpacity(0.15),
                        ],
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: '$category\n',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: '$numOfBrands Brands')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 350,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  child: Image.network(
                      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAO0AAADVCAMAAACMuod9AAABuVBMVEXsvD/////u7u7t7e339/fMVSH19fX6+vrwgGF+KAry8vL8/PzwwEDsuS/v8PLm2Lnx48VUAABOAAC6SxVWAABJAADquT5NAAD36+K8UBfYpDdIAABcAADmtDxDAAB6JQlzHwh7HwDSnjWea2HeqznJlDHShCpyFQC0fSphCgClayTNmDPWojbDjS9fEwlrGAfh1dHhpTa/VxnNeSbk396QUxqAPRNDEwCZYCF0NBPR3NRlHQxsKA+obyOJShTj6OTqx6fmvpu4f2DZrIlwJgDFZR/ZlDDYkS+iRSm1UzeQNhrbcFHFX0KnYx+WZV5vLiiCTEWvkovGwbl4XlCWlYZVRCpre16kt6Ovh35bXT6SnYRRKRHP4M5qeU+1zbCcu5ZnXVJZbDl0h11VVUJOLg7X59aSqoexvrNkcVVWTiuWpZJQRC6AYl98lnlHMxl8i3hubUZhOi13gFiGdWivrKJkfGU/OyNOXEU+HQl8jnzRtK6STDZRFgDIqKFCOiR6NShvSkCkd2+LU0xfKiFvWz6jnYpkUT+FPSecZU/CjWxBMBGMfXVcHR6HpISUk3xbOCNGVTOgYQB7VFA0flZmAAAVAElEQVR4nO1d+2PTRra2ZdfGo7npSsg2ODKxg5P4EcchD8cxsdWHAyQFQhMglKRpb5dgCAWWkra0JRe6tLS9UHbv/sV3RvJDljTSSJZjk3J+2H5k7Zn5dObM+WY0M/Z4sfl9DMP46GDQBLJkyNLBIBl6TaCfDnresX3H9kixxUYHg3SwwaAL2CBDBf100OP/K5nH5HkEZMhQQSBD0EvIyDBABQmd08MYdnD5rwELyOggwBC4DwNyHTros4DagYd5x/YIs1UFK8MYxS1dCAMtdDVY6eLWp4X6uG1ixjcNWKNPaKFl2nE1A1EmI9oM1PSz73Jm7cqn65IfgKOvLpi5tUyiIHJTG1fr5UZXOspsr2RCodBIIiPw165vgiPOlrnBjYRCCmHu6Web0pGMW0VSBfz+6bOFUMNGCiJ/7eZu8/9p/ufth6oM1HSubAmR37q53Xo0RyUDtdXF9FShzTYkZOf5rW+2g0dLXbTZeh8LbeeOcDGYKgkLn+9IQ0eTbT3adm5iKu7xIL7iwudf7ALmqLBVD15fii3nFhY92GAqK4b/+wupIS3f+rhVsOw1bz3ccm6hCj0K33hWfIr6M3CSZF3Ntyapl/HTwY51Kf+XrcjNlBpsZb5K/B4ldYGbXR9uOlestNhiviVx66udo8YW/L3pXDGtYovjd5679dXuW8mWQfMc4zXH+kLDuUInW8Q3Vo1eu737FipHqV4HGuWILegPgjsN5+rYeiAcLYbv3paC8odVXxtQiP4nGJDqe3fuLXzN6pUjfh6gfitj1JMVvp58bfizHfnDg52BcL7179Zv3rn2lBczmZ9Ja47MfS6hG6XafCPpzPDnO96BVhfoS0x58/6dB6eiGbEwMhJKniatwoHdu6ImA3XyjWe5rT8lpSkDyTbISPWHdxfCmWo6lprCcUlmywS/4BNqdaHnG6uGX9bxes5Asg3UH947FU1kcxEIYVzQsNWNY/5/iLJyJLFFw1W+Fn1TBsyAxS16MoHy3t9P8bXKJGokbmpKxVajHBtKGuw8LeBZQYTEFodvRXhUZ1GnwaakHRuQ1cKgM9he+pZhEFFdCNeyTaqYLaew9RspR4W49A16IiNciswWq41q+LGkTIrkr/VXXaBHJ22iYUks5dpUcdA12AbI72+HtreQc7k8sSsrJeULr/e1c4X+sAVAqn/73SmhmI9o2pyzZsuAm+hDxilITTde4r+eBn1ni9LN3vdPoolKCuoEUZ4LWbJldq9lQoWiBVtUWK7GHTTH/W4o0hEnsC3/gNxa1blVbmBa0LANYmsoxyb0b3IJefHCim4ky12eZtsl+HsJgzrIsqD+8MFwwcCtSvuyosKWbXzN+G11EGUhbsySLSpvsvb6wDfUnwzkl3C+0Udru3XVTKgzA8nDqm6WtPM0QVJTOvfyl6dBP9SFtHcPDcKTxm5VGrdUCJlqqeYs6RuhsERBFheZKyD3Hi5b4GXLqAvX0nFTj0QEWfMnf7ZgC7a3MtwoJd34fPTy9CGyxRnnzkK0mPdY9L4YLyeg3+bIyrFB/KbAUXVlmW+eW/sRf+0w4pZhsDwU5826cKtZsmtx0xpxyyJDAgogme9VQe/uNeGsiXjUlBtbFG74AJI0LNaTuARLGMSQtQuBv/zDvVOZLGEU7mxVCQ/JyRu4BD8mx5L3wm1yvIWcUlukhHoz6HW+Bb46Rbi22C6iQSr501w7QMls/f/grAWGqug0d0UJ3p5pKYC08JOoScbRWAoPUsmfAQ1b7/ZTbtQO3dGMEry9YivtfX+Kq9I3SQnbwmWGiq33Pj9vgy2aFy2KBz3ryVggivMxinBttaeEtMWIsK/2rSIXcfwDDWS3rwkxW3QjVe5GgDUsTA8VLUcDkaaVuVINTW2LYG2Ree4LtAsz2+fo3wxTJ6Hm44yengu0k4ZLGejEm/85lanQDU1tG0UzuQS339wxY6Iclb9Kn9lzLqJbiV6eU9rqmro48emzaCFNOzS1m4KmBCPCY0n1ctN055/fu7lgK3JxHenoz0EX2QZOHDzjl+xzRYY6cuZRGdDvcwxej1LKRzXdG66xBXPIr4uWCtGwHagjJ/AQRXxbrYEoALe37OTcJt0DV+I2MDR3sMY74yoLqRHhFfJZx9tqLKiUYZRpQ9CEzMOwDUHVpMsfBJQSgu3CFBjE4pRV/ooboYNB+cMYBZiDtWhxzBlXjyc+lcg8B1gvKoKTNVeOyhJV+V7Beg1DS7ci/Ah0ORTPXWSnsYG5aWRzsk13wDnls1gjzh1c4YtjtlJORxvSQmKqrA1QqzMjYG/YZhbCVc2/VkQkyww1KQLE5seDg09vnL585dna2hQyodOmptbWrpy+8eP0HOp+P8pcHVLFtpQRrupe8Fqylb7n7ejHhhXXUBFs0IcYIoo3fr58ZW1NFPgoz4mFWrE6X8pW0ul8fiyXy40iy+XG8vl0pTRfrAlRburZ71eixZxjv3pk1ShsSLbZMqD+oEY982tZKvPPG6dP//PZ2YzAIYaIYKmSzudiqXjEA1vmkYNSZgUbf/bEY/lsUeiOK7JF7kUZ6HciyBqxMTSpINuGe6ey9vvyGHJjplZEHMdGEcUWPZrvQk/K6djULCLPC+t+NDRhRooMZa2UY+OllvSYz9mvPDeaarixq3Y7s8gi/6qVdtQZyFRdyBCUXyZsj8t9NZTy/+M3iEqqMyOgbm/q13eLF5Tk4+yEDLgaNdiGMbAGs/y+4YhrpRwViEKXm3x76E5yr5oTH23cGshFPfRKz+1Lqr5Z7XnAC9pyEVArxyZk119X+02C0mCFK3d72hjsR+1n3X4YHJWDtju2DHM1/FaMVPHCY7Zrtmik+pJzIDIO22D1heQls6UapTAMlB+INlepDt9Q0K57NUOTepSiyUANWH9SSA02XZiP/hrUph11BqJRF01YX6gNdB6Co8JjVtERBHVhhy2oh4v2Z3+HZjAl/iK5eLYa7A8wXZjKbOzaOCFjEbdexsfs8xqVMTCBDFOFDTwcm56QoR6TFehd59R0YWxQkjD2rBQwGojtK0cVXFd5F44JAyIo4aS4gc/guX1PDYs6cyN2YTo8IHISPfaNQE9u5QHrr4vy+zaYjdpeWu+NwTT/Kmj7PBAVWx9Yf1FDMgOW+K5WfF0z6Cnxv5LFsSPl2CEiXyBVVXGyOOeGxTvf+MFUMbppIhcdKkfVsZjyo0zFzpYbNw3OL6n1OsyLWzuqXNOLW3nKD6JWG5h7Zqmi0AohGC9FH+96VXKxF/fU1J8s9k9UwVJzeIRjhRd1tte38rDf2n/T6SbdShSPGTA1zz+WNBRdVI6tuH1CPkFzKHRLQgxG0uKLfXtnq+2MycEmDDwc7nOmhdWlfI2/KnmtB+KulGMQv8N+QLl5uXcWX4q+LGviryfqggE/nOr7ZABOcv82WYFyUUuVv8v0fw0DVoY3D4Wtkze67luk9tJvl60D5Sh9z8X6TdWDDzSE616KoalL5Vh/YnsTVU8MVp9LjL0M5EBd/GCSfiCMRLp/HQ89NKXAGL8PenzDoV/6rkASjTCVXZyaWsx2t+wMY3IpFctS4PxzCfSULeOvE8comBaEQiJREPQ3KtixCqeUMmWlYPAbLnts7cftQ57wggRmw0s//ZRMhkIJvotBez78m1JKgbd6aLC6oQtW07i13COu3ZFevkcYo2A6+tGHH3zw8U8yXafehRXuD1zKb3IpVoeAx/iy3DTKjez28+0mSUfFxd8/OHHixPsf4oYWBIf6I8V/hEv54GP5JiSrI0mRwivjUHRLXVwXjM+Yw4rw8d9O4IZ+lMSXoTib7MOS+PEJuZTfk/gGM4suAisvyqCHbMsPSHdDLCY+lNv5/h+YbWHJ0Ww/cvY3pRTlmVmdeYYxbr+XbDdJyTYlTKh9a3HNAMlGuZDKtyHLM8+w+FKyqRz15/hYAvQG74iE+nNc8iMlblflm26oTivrGp9vlvJx4zK+SYsvpIfrrWN6ciO10Kv6q923XuVbhG1xMC+Ekq0xGQeuk/k+Pume/ENViuVxsxS/ZyMD2VMXYI/UkeEYNxJKriqZUm6nU7ah5G+qUixPcdS+7NkqnETsyGh2LR/tTbYuhLR72kS2MeXIbLsUq+iHWbytpCdsQf0BcX9nfCoRUhnNnQoGllLdoEk1sqN533qPlCP4czhPrFa5gKBpGeIlRuaNL6qvRw2J1oca4uJVu8qx874LImSIHRk/ZF7llhGHb8RgXl1KgmIzKay+BKQLMbTQXr7d/l8Tj8GqqHKKM9ciW1R1EYFiXzRMvy4zPVEXRI0sW/xsq6GZs460BW58bKpVirhIEftwEk37esGWvW46RMLYknLBREJYcr5rDo6ebZTCLVKtCqCZQS/YMtLdRfOGxktTnCBwQsnuWVlNKQIuZSpLp7TxCgblRZb6u8PIEGwvWE3SYXwsnc53w1UuJZVPp8doS4H5aFlhq6ytmEBbGehmOEdRuStnYuyUkuLWg5QZyIa6YO+IA7kRDtZeqbqhW1pKIk5t6RoFPRH5YJtrNJsFZx9J7rOtd/WuC06WFs9OnV0sOZkJmluOXweuK8f7fBfHZOCYIBYSCfzrHotOczHJIuI+cFs5Mp8RV80pTLkiRxaVotsvVmB1w29LOZKfRxMC8ooUVYtGBTHRZOseUaXs9Gtg1Dl1kF5dAHPZaN2k2DySHqLIcUW3ezKaJ65rBp6utdT9aGvVBML4GWRxW+Mr+tIoUg35mKMLHTyRFK6RMKTXXrnMtr1sAVPjyyePIzu5PG7v/ZbT87jtGmdmzxnc9AGzz6leXHf8XoEZBK03IqlZVGvDjh+fdb1b6rmc6ahx5rxusIQ5TmrwMv+9AuoMtH1LXkeA504eP/ley9A/zvX61fX48Y4aTx5fPqOtMi7nILm97ihHRVvAcXXNCt/x3pKd1dV4UveEYfVr4KqW2htGgxQ8p60a0+2pd3Vk5So13oXpR5KrbB9yaJCKn9RXjZ517/YTwfMGZFGVM51Vwkm+rt+U4Fw5Bu8U5H5sUPV7x8d75lzDx4udO9tZZaTQ3oJhEreUv3bgl+6iITkyY1z3TK9mgvphgtCf4PwGBQta5ciUH6Ah+Yxx3SiMesTWY/x4cZXnO9li8eiacgSbC5U+sE0RXIuiR9OVY1zZPS0Fbg+jBGQwIitVn7PFAULalRjC48VPeFnz0cKvLrL9MzzWvW8hjMRjo/jCofzYZJxCL9OzRYHLusgW3xBHGiHpUhBM5S+thpITDQsVrfd/mbHVZtzXknE2VbOlzUC3+RgqctY4Ay1TdEuYm09OJEOrF1ZWVi5eXFm5sIr+WbH4EuHxvqePW0+MX7fOQLTq4ibetwoNnzVVR45fmphYXfnkmNouhiYuWTyiZeKYrBVwkcyvDbYuaKnbyi5dAx2ny/RGllqdWO2kiu2T1QmLFQLSuKhP8bD62HW2kWX9rGDZWltEihMXdFwx3WTIPORJeub4ee1TgukXAUu2lnHb2JR8u3GPpZYuFVmYNiZ77NiKlXMJsaPNP/IWz7Jl3PrpLHg73FwHPo/mtI0WoLnmyfO6eg08FAoZk0XOtTiubDQtOHl8xqBHoDlu0IIFtXLcWWg6AcbHZ443bGac5t0UHCW59tix1aTF4geme1LrWaNaUeACxh3lyOw+UP36YuTMufHZ2fFzZ+hug4X5iYsktisTVlsW4JkZFV95dcgwdmDlkdW2OGq20me1zlOvNtbTzNhetApcbOeWmwtT6L+zunWaRi05rjzk0pojuOl0D67MdoXE9pOJSxR7KzxnxmeXZ2ZmlmfPkVuBF6fo2FrFrQ9sDjs/Nz5JjttPknQ37KEPRSIRU2kNi6+ARdzSKkfv7i37F7I2LU4ck48dS3b1mrSDbfZ50K01R//nzl96wUsTeiFlz7c0teR5q5tbqNl6b4cdXD/baMcYsStTxS2lpfi6a2y76cqeKsm5VGMyrWXeuKQckX1D3vZnZTA3QYjcCxOOe4y+luovrCvKEYvHnS7uwYOViVXjsF11b70SVrZ2XVGOPnxjp0Zg2LNLRlM+5FoXOzIc47cZN5QjhmAz2k2vuzSR1GmMFTddi3dObZpuArS38+9aV3sR8qGJUMfqBZrMh1y9RjCSeOMaW5+yXOPYYLwSmpgIXVi5iG3lAvpH1d23v7C6Ybp510bcIri71UUSwq2J5y+pFh0v5Vy+aA1W/tXc4NmlcpST0TeEY2307YGRVC6fTuMr3538eIhF6UhNmbnL5imKnYXunNtoVM+uQ4/x20GXdv7hEzKfd+vc3lpc3HOR7ZA7zu2Zwdob9a7qbpQjPtmGnDvIV8/C+V+AO8qxIR9vuTYf7YHB9JbkjnJUIPuVk98dOTQbi26bZSDDDm4Gt28Nxt0ehgZj/KZ2DHKspWR4PzoYFxsaWly86Spbdvua+TmZvhqsXadgSx233iBzf4Dve4fVu0GTuLWXb2W4ezcxkGdHsMHs1jZwS10oUN5xMpgG88M7LrOV7jr4OajDMTga3nSZrXezr7c5mlqKu2nC1p5ybEDpXwOrluPiG8AQlaPl3kADGJTIx+f7brXHfmLbHWQgnw/ULQ9r9s1gdcMkAxl2cDOI73P889TAxi0s4Vdfbt5eKV3v5oxbbw2mHwFX2YLyvwf3l6Bg/rVkydZO3IK62dUI/bZR5bAMWTmanr6WYaAD7vX/GlaypeTjqYqPVIs2jIm68JmpC/Zb0j14g2BxzQ8ad6ulpO8S/aZkZpl94KZy3B7odUdYe0Vm60A57oUH+Qe+lC1xxsOsx/I8sg7672QGdQaEDc5/7SedE3eQgcpP5v9rkO3//kPOQIYd3FRdSPvr77//N9nexzZocHrdIL84ZsuAoaEhBQ4NNSFrGyq/Pm4bBumgizqZCFkyZOlgkAy9JtDsFXWXypEKNhh0AVWvnS2h2dYSW8oRtJWjbQi6gQFn0Ow+JSfKkQxxW32AEvraFK2g8ZV+JtBF5diEjA5271ATNzM6aEX8HVvDnuxr86KC7c7XM9gmYw1JPRkLquaV2W0Y6AIGdBDYgwEd9HcBgeqvf7EMZOjyo64u3rE9umz/InHb/j0ZrwkMWEKvBQR0MGAEWTvQbwIPWzkS0+k75ci8U449YEvoyVYislfKkUou0vTkxniExBVrGwZkGDh8CGTotw3/YhnI0OVHXV38Ndj+P5r40JwsNfMPAAAAAElFTkSuQmCC'),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('By Bui Trong Nghia'),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
