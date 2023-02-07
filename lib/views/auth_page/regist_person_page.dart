import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/auth_page/email_send_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistPersonPage extends StatefulWidget {
  const RegistPersonPage({Key? key}) : super(key: key);

  @override
  State<RegistPersonPage> createState() => _RegistPersonPageState();
}

class _RegistPersonPageState extends State<RegistPersonPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  String errorMassege = '';
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  const Align(
                      alignment: Alignment.topLeft, child: BackButton()),
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset('assets/images/logo2.png'),
                  const SizedBox(
                    height: 54,
                  ),
                  Text(
                    errorMassege,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    controller: _emailController,
                    hintText: 'メールアドレス',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'メールアドレスを入力してください';
                      }
                      final regex = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                      if (!regex.hasMatch(value)) {
                        return 'メールアドレスを入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    controller: _passwordController,
                    hintText: 'パスワード',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'パスワードを入力してください';
                      }
                      final regex =
                          RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9.?/-]{6,24}$");
                      if (!regex.hasMatch(value)) {
                        return '大文字含めたアルファベット6文字以上24文字以下のパスワードにしてください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    hintText: 'パスワード',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'パスワードが一致していません';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          }),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: '利用規約',
                              style: const TextStyle(color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final result = await _showTurmsOfTheServise();
                                  if (result == true) {
                                    setState(() {
                                      _isChecked = true;
                                    });
                                  }
                                  // なにか同じハッシュタグの投稿を検索し直す処理
                                },
                            ),
                            const TextSpan(text: 'に同意する'),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OriginalButton(
                    primary: const Color.fromRGBO(247, 63, 150, 1),
                    onPrimary: Colors.white,
                    text: '新規登録',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      if (_isChecked == false) {
                        errorMassege = '利用規約に同意されていません';
                        //状態を変化させる
                        setState(() {});
                        return;
                        //これより先にコードが動かないようにする。
                      }

                      final email = _emailController.text;
                      final password = _passwordController.text;
                      await AuthRepository.singUp(
                          email: email, password: password);

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => EmailSendCheck(
                                email: email,
                                from: 1,
                                password: password,
                                isStoreOwner: false,
                              )),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<bool> _showTurmsOfTheServise() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // ignore: use_build_context_synchronously
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(16),
            title: const Text('利用規約'),
            children: [
              const Text('''
この利用規約（以下，「本規約」といいます。）は，シーズン（株）（以下，「当社」といいます。）がこのウェブサイト上で提供するサービス（以下，「本サービス」といいます。）の利用条件を定めるものです。登録ユーザーの皆さま（以下，「ユーザー」といいます。）には，本規約に従って，本サービスをご利用いただきます。
第1条（適用）
本規約は，ユーザーと当社との間の本サービスの利用に関わる一切の関係に適用されるものとします。
当社は本サービスに関し，本規約のほか，ご利用にあたってのルール等，各種の定め（以下，「個別規定」といいます。）をすることがあります。これら個別規定はその名称のいかんに関わらず，本規約の一部を構成するものとします。
本規約の規定が前条の個別規定の規定と矛盾する場合には，個別規定において特段の定めなき限り，個別規定の規定が優先されるものとします。
第2条（利用登録）
本サービスにおいては，登録希望者が本規約に同意の上，当社の定める方法によって利用登録を申請し，当社がこの承認を登録希望者に通知することによって，利用登録が完了するものとします。
当社は，利用登録の申請者に以下の事由があると判断した場合，利用登録の申請を承認しないことがあり，その理由については一切の開示義務を負わないものとします。
利用登録の申請に際して虚偽の事項を届け出た場合
本規約に違反したことがある者からの申請である場合
その他，当社が利用登録を相当でないと判断した場合
第3条（ユーザーIDおよびパスワードの管理）
ユーザーは,自己の責任において,本サービスのユーザーIDおよびパスワードを適切に管理するものとします。
ユーザーは,いかなる場合にも,ユーザーIDおよびパスワードを第三者に譲渡または貸与し,もしくは第三者と共用することはできません。当社は，ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には，そのユーザーIDを登録しているユーザー自身による利用とみなします。
ユーザーID及びパスワードが第三者によって使用されたことによって生じた損害は,当社に故意又は重大な過失がある場合を除き，当社は一切の責任を負わないものとします。
第4条（利用料金および支払方法）
ユーザーは，本サービスの有料部分の対価として，当社が別途定め，本ウェブサイトに表示する利用料金を，当社が指定する方法により支払うものとします。
ユーザーが利用料金の支払を遅滞した場合には,ユーザーは年14,6%の割合による遅延損害金を支払うものとします。
第5条（禁止事項）
ユーザーは，本サービスの利用にあたり，以下の行為をしてはなりません。
法令または公序良俗に違反する行為
犯罪行為に関連する行為
当社，本サービスの他のユーザー，または第三者のサーバーまたはネットワークの機能を破壊したり，妨害したりする行為
当社のサービスの運営を妨害するおそれのある行為
他のユーザーに関する個人情報等を収集または蓄積する行為
不正アクセスをし，またはこれを試みる行為
他のユーザーに成りすます行為
当社のサービスに関連して，反社会的勢力に対して直接または間接に利益を供与する行為
当社，本サービスの他のユーザーまたは第三者の知的財産権，肖像権，プライバシー，名誉その他の権利または利益を侵害する行為
以下の表現を含み，または含むと当社が判断する内容を本サービス上に投稿し，または送信する行為
過度に暴力的な表現
露骨な性的表現
人種，国籍，信条，性別，社会的身分，門地等による差別につながる表現
自殺，自傷行為，薬物乱用を誘引または助長する表現
その他反社会的な内容を含み他人に不快感を与える表現
以下を目的とし，または目的とすると当社が判断する行為
営業，宣伝，広告，勧誘，その他営利を目的とする行為（当社の認めたものを除きます。）
性行為やわいせつな行為を目的とする行為
面識のない異性との出会いや交際を目的とする行為
他のユーザーに対する嫌がらせや誹謗中傷を目的とする行為
当社，本サービスの他のユーザー，または第三者に不利益，損害または不快感を与えることを目的とする行為
その他本サービスが予定している利用目的と異なる目的で本サービスを利用する行為
宗教活動または宗教団体への勧誘行為
その他，当社が不適切と判断する行為
第6条（本サービスの提供の停止等）
当社は，以下のいずれかの事由があると判断した場合，ユーザーに事前に通知することなく本サービスの全部または一部の提供を停止または中断することができるものとします。
本サービスにかかるコンピュータシステムの保守点検または更新を行う場合
地震，落雷，火災，停電または天災などの不可抗力により，本サービスの提供が困難となった場合
コンピュータまたは通信回線等が事故により停止した場合
その他，当社が本サービスの提供が困難と判断した場合
当社は，本サービスの提供の停止または中断により，ユーザーまたは第三者が被ったいかなる不利益または損害についても，一切の責任を負わないものとします。
第7条（著作権）
ユーザーは，自ら著作権等の必要な知的財産権を有するか，または必要な権利者の許諾を得た文章，画像や映像等の情報に関してのみ，本サービスを利用し，投稿ないしアップロードすることができるものとします。
ユーザーが本サービスを利用して投稿ないしアップロードした文章，画像，映像等の著作権については，当該ユーザーその他既存の権利者に留保されるものとします。ただし，当社は，本サービスを利用して投稿ないしアップロードされた文章，画像，映像等について，本サービスの改良，品質の向上，または不備の是正等ならびに本サービスの周知宣伝等に必要な範囲で利用できるものとし，ユーザーは，この利用に関して，著作者人格権を行使しないものとします。
前項本文の定めるものを除き，本サービスおよび本サービスに関連する一切の情報についての著作権およびその他の知的財産権はすべて当社または当社にその利用を許諾した権利者に帰属し，ユーザーは無断で複製，譲渡，貸与，翻訳，改変，転載，公衆送信（送信可能化を含みます。），伝送，配布，出版，営業使用等をしてはならないものとします。
第8条（利用制限および登録抹消）
当社は，ユーザーが以下のいずれかに該当する場合には，事前の通知なく，投稿データを削除し，ユーザーに対して本サービスの全部もしくは一部の利用を制限しまたはユーザーとしての登録を抹消することができるものとします。
本規約のいずれかの条項に違反した場合
登録事項に虚偽の事実があることが判明した場合
決済手段として当該ユーザーが届け出たクレジットカードが利用停止となった場合
料金等の支払債務の不履行があった場合
当社からの連絡に対し，一定期間返答がない場合
本サービスについて，最終の利用から一定期間利用がない場合
その他，当社が本サービスの利用を適当でないと判断した場合
前項各号のいずれかに該当した場合，ユーザーは，当然に当社に対する一切の債務について期限の利益を失い，その時点において負担する一切の債務を直ちに一括して弁済しなければなりません。
当社は，本条に基づき当社が行った行為によりユーザーに生じた損害について，一切の責任を負いません。
第9条（退会）
ユーザーは，当社の定める退会手続により，本サービスから退会できるものとします。
第10条（保証の否認および免責事項）
当社は，本サービスに事実上または法律上の瑕疵（安全性，信頼性，正確性，完全性，有効性，特定の目的への適合性，セキュリティなどに関する欠陥，エラーやバグ，権利侵害などを含みます。）がないことを明示的にも黙示的にも保証しておりません。
当社は，本サービスに起因してユーザーに生じたあらゆる損害について一切の責任を負いません。ただし，本サービスに関する当社とユーザーとの間の契約（本規約を含みます。）が消費者契約法に定める消費者契約となる場合，この免責規定は適用されません。
前項ただし書に定める場合であっても，当社は，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害のうち特別な事情から生じた損害（当社またはユーザーが損害発生につき予見し，または予見し得た場合を含みます。）について一切の責任を負いません。また，当社の過失（重過失を除きます。）による債務不履行または不法行為によりユーザーに生じた損害の賠償は，ユーザーから当該損害が発生した月に受領した利用料の額を上限とします。
当社は，本サービスに関して，ユーザーと他のユーザーまたは第三者との間において生じた取引，連絡または紛争等について一切責任を負いません。
第11条（サービス内容の変更等）
当社は，ユーザーに通知することなく，本サービスの内容を変更しまたは本サービスの提供を中止することができるものとし，これによってユーザーに生じた損害について一切の責任を負いません。
第12条（利用規約の変更）
当社は，必要と判断した場合には，ユーザーに通知することなくいつでも本規約を変更することができるものとします。なお，本規約の変更後，本サービスの利用を開始した場合には，当該ユーザーは変更後の規約に同意したものとみなします。
第13条（個人情報の取扱い）
当社は，本サービスの利用によって取得する個人情報については，当社「プライバシーポリシー」に従い適切に取り扱うものとします。
第14条（通知または連絡）
ユーザーと当社との間の通知または連絡は，当社の定める方法によって行うものとします。当社は,ユーザーから,当社が別途定める方式に従った変更届け出がない限り,現在登録されている連絡先が有効なものとみなして当該連絡先へ通知または連絡を行い,これらは,発信時にユーザーへ到達したものとみなします。
第15条（権利義務の譲渡の禁止）
ユーザーは，当社の書面による事前の承諾なく，利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し，または担保に供することはできません。
第16条（準拠法・裁判管轄）
本規約の解釈にあたっては，日本法を準拠法とします。
本サービスに関して紛争が生じた場合には，当社の本店所在地を管轄する裁判所を専属的合意管轄とします。
以上'''),
              OriginalButton(
                  primary: const Color.fromRGBO(247, 63, 150, 1),
                  onPrimary: Colors.white,
                  text: '同意する',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
            ],
          );
        });
    if (result == null) {
      return false;
    }
    return result;
  }
}
