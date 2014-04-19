<?php namespace Eduapps\Forms;

use Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Select,
	Phalcon\Forms\Element\Date,
	Phalcon\Forms\Element\Numeric,
	Phalcon\Forms\Element\Hidden,
	Phalcon\Forms\Element\Password,
	Phalcon\Forms\Element\Submit,
	Phalcon\Forms\Element\File,
	Phalcon\Forms\Element\Check,
	Phalcon\Validation\Validator\PresenceOf,
	Phalcon\Validation\Validator\Email,
	Phalcon\Validation\Validator\Regex,
	Phalcon\Validation\Validator\Identical,
	Phalcon\Validation\Validator\StringLength,
	Phalcon\Validation\Validator\Confirmation;
use Eduapps\Backend\Models\KhoaDonvi,
	Eduapps\Backend\Models\Khoahoc,
	Eduapps\Backend\Models\Hedaotao,
	Eduapps\Backend\Models\Nganhhoc,
	Eduapps\Backend\Models\Quyetdinh;

class HosoSinhvienForm extends Form
{

	public function initialize($entity=null,$options=null)
	{

		//In edition the id is hidden
		
		if (isset($options['edit']) && $options['edit']) {
			$id = new Hidden('id');
			$NgaySinh = new Text('NgaySinh',array(
					'class' 	 =>'datepicker',
					'data-date-format' =>'yyyy-mm-dd',
			));
			$NgaySinh->addValidators(array(
	                new Regex(array(
	                'pattern' => '/^([0-9]{4})[-\/](0[1-9]|1[012])[-\/](0[1-9]|[12][0-9]|3[01])$/',
	                'message' => 'Định dạng ngày tháng không đúng'))
	                
	        ));
	        $NgayVaoDoan = new Text ('NgayVaoDoan',array(
					'class' 	 =>'datepicker',
					'data-date-format' =>'yyyy-mm-dd'
			));
			$NgayVaoDang = new Text('NgayVaoDang',array(
					'class' 	 =>'datepicker',
					'data-date-format' =>'yyyy-mm-dd'
			));
		} else {
			$id = new Text('id');
			$NgaySinh = new Text('NgaySinh',array(
					'placeholder'=>'vd.19/08/1990',
					'class' 	 =>'datepicker',
					'data-date-format' =>'dd/mm/yyyy',
			));
			$NgaySinh->addValidators(array(
	                new Regex(array(
	                'pattern' => '/^(0[1-9]|[12][0-9]|3[01])[-\/](0[1-9]|1[012])[-\/][0-9]{4}$/',
	                'message' => 'Định dạng ngày tháng không đúng'))
	                
	        ));
	        $NgayVaoDoan = new Text ('NgayVaoDoan',array(
					'placeholder'=>'vd.19/08/1990',
					'class' 	 =>'datepicker',
					'data-date-format' =>'dd/mm/yyyy'
			));
			$NgayVaoDang = new Text('NgayVaoDang',array(
					'placeholder'=>'vd.19/08/1990',
					'class' 	 =>'datepicker',
					'data-date-format' =>'dd/mm/yyyy'
			));
		}

		$this->add($id);
		$MaSV = new Text('MaSV',array('placeholder' =>'vd.1159014001'));//<input type="text" value="" id="MaSV" name="MaSV">
		$MaSV->setLabel('Mã Sinh Viên');//<label for="MaSV">MaSV</label>

		$MaSV->addValidators(array(
			new PresenceOf(array(
				'message' => 'Mã sinh viên không được rỗng'
			))
		));
		$this->add($MaSV);
				

		$HoSinhVien = new Text('HoSV',array('placeholder'=>'vd. Tran'));
		$HoSinhVien->setLabel('Họ Sinh Viên');
		$HoSinhVien->addValidators(array(
			new PresenceOf(array(
				'message' => 'Họ Sinh Viên Không Được Rỗng!'
				))
		));
		$this->add($HoSinhVien);

		$TenSV = new Text('TenSV',array('placeholder'=>'vd. Thien'));
		$TenSV->setLabel('Tên Sinh Viên');
		$TenSV->addValidators(array(
			new PresenceOf(array(
				'message' => 'Tên sinh viên không được rỗng !'
				))
		));
		$this->add($TenSV);

		$GioiTinh = new Select('GioiTinh',array(
				'' => 'Giới Tính',
				'Chưa Biết' =>'Chưa Biết',
				'Nam'=>'Nam',
				'Nữ' => 'Nữ',
				
		));
		$GioiTinh->setLabel('Giới Tính');

		$GioiTinh->addValidators(array(
			new PresenceOf(array(
				'message' => 'Giới Tính Không Được rỗng'
				))
		));
		$this->add($GioiTinh);

		

		$NgaySinh->setLabel('Ngày Sinh');
		$this->add($NgaySinh);
		$NgayVaoDoan->setLabel('Ngày Vào Đoàn');
		$this->add($NgayVaoDoan);
		$NgayVaoDang->setLabel('Ngày Vào Đảng');
		$this->add($NgayVaoDang);

		$DanToc = new Text('DanToc',array('placeholder'=>'vd. Kinh'));
		$DanToc->setLabel('Dân Tộc');
		$this->add($DanToc);
		$TonGiao = new Text('TonGiao',array('placeholder'=>'vd.Không '));
		$TonGiao->setLabel('Tôn Giáo');
		$this->add($TonGiao);

		$SoChungMinh = new Numeric('SoChungMinh',array('placeholder'=>'vd. 221271045'));
		$SoChungMinh->setLabel('Số Chứng Minh Thư');
		$SoChungMinh->addValidators(array(
			new StringLength(array(
				'min' => 9,
				'maxlength' =>10,
				'messageMinimum' => 'Số chứng minh thư phải 9 ký tự'
			)),
		));
		$this->add($SoChungMinh);

		$SoHoChieu = new Text('SoHoChieu',array('placeholder'=>'vd. '));
		$SoHoChieu->setLabel('Sổ Hộ Chiếu');
		$this->add($SoHoChieu);

		$DiaChiTamTru = new Text('DiaChiTamTru',array('placeholder'=>'vd. Hồ Chí Minh'));
		$DiaChiTamTru->addValidators(array(
			new PresenceOf(array('message'=>'Địa Chỉ Tạm Trú'))
		));
		$DiaChiTamTru->setLabel('Địa Chỉ Tạm Trú');
		$this->add($DiaChiTamTru);

		$DiaChiThuongTru = new Text('DiaChiThuongTru',array('placeholder'=>'vd. Bình Dương'));
		$DiaChiThuongTru->setLabel('Địa Chỉ Thường Trú');
		$this->add($DiaChiThuongTru);
		$DienThoaiDD = new Numeric('DienThoaiDD',array('placeholder'=>'vd. 0909340777'));
		$DienThoaiDD->setLabel('Điện Thoại Di Động');
		$DienThoaiDD->addValidators(array(
			new StringLength(array(
				'min'=>'10',
				'maxlength'=>'11',
				'messageMinimum'=>'Điện thoại phải là số và lớn hơn 9 ký tự'
				))
		));
		$this->add($DienThoaiDD);
		$Email = new Text ('Email',array('placeholder'=>'fcduythien@gmail.com'));
		$Email->setLabel('Email');
		$Email->addValidators(array(
			new Email(array(
				'message' => 'Địa chỉ Email không hợp lệ'
			))
		));
		$this->add($Email);

		//informaton student
		$MaLop = new Text('MaLop',array('placeholder'=>'vd. 115901'));
		$MaLop->setLabel('Mã Lớp');
		$MaLop->addValidators(array(
			new StringLength(array('min'=>'3','messageMinimum'=>'Mã Lớp Phải Lớn Hơn 3 Ký Tự'))
		));
		$this->add($MaLop);
		$MaKhoa = new Select('MaKhoa',KhoaDonvi::find(),array(
					'using' =>array('MaKhoa_Donvi','TenKhoa_Donvi'),
					'useEmpty' => true,
					'emptyText' => 'Khoa',
					'emptyValue' => '',
					'onChange'=>'this.form.submit()'
			));
		$MaKhoa->setLabel('Mã Khoa');
		$MaKhoa->addValidators(array(
			new PresenceOf(array(
				'message' => 'Mã Khoa Không Được Rỗng'
				))
		));
		$this->add($MaKhoa);
		
		$MaKhoaHoc = new Select('MaKhoaHoc',Khoahoc::find(),array(
				'using' =>array('MaKhoaHoc','TenKhoaHoc'),
				'useEmpty' => true,
				'emptyText' => 'KHóa Học',
				'emptyValue' => '',
				'onChange'=>'this.form.submit()'	
		));
		$MaKhoaHoc->setLabel('Mã Khóa Học');
		$MaKhoaHoc->addValidators(array(
			new PresenceOf(array(
				'message' => 'Mã Khóa Học Được Rỗng'
				))
		));
		$this->add($MaKhoaHoc);
		$MaNganh = new Select('MaNganh',Nganhhoc::find(),array(
			'using' =>array('MaNganh','TenNganh'),
			'useEmpty'=>'true',
			'emptyText' => 'Ngành Học',
			'emptyValue' => '',
			'onChange'=>'this.form.submit()'
		));
		$MaNganh->setLabel('Mã Ngành');
		$MaNganh->addValidators(array(
			new PresenceOf(array('message'=>'Mã Ngành Không Được Rỗng'))
		));
		$this->add($MaNganh);
		$MaHeDaoTao = new Select('MaHeDaoTao',Hedaotao::find(),array(
				'using' =>array('MaHeDaoTao','TenHeDaoTao'),
				'useEmpty' => true,
				'emptyText' => 'Hệ Đào Tạo',
				'emptyValue' => '',
				'onChange'=>'this.form.submit()'
		));
		$MaHeDaoTao->addValidators(array(
			new PresenceOf(array(
				'message' =>'Mã Hệ Đào Tạo Không Được Rỗng'
				))
		));
		$MaHeDaoTao->setLabel('Mã Hệ Dào Tạo');
		$this->add($MaHeDaoTao);
		//file_field import
		$images = new File('images');
		$images->setLabel('Hình Đại Diện');
		$this->add($images);
		$fileImport = new File('fileImport',array('required'=>''));
		$fileImport->setLabel('Mẫu Upload');
		$this->add($fileImport);
		$NoiSinh =new Select('NoiSinh',array(
			''=>'Nơi sinh','TP Hà Nội'=>'TP Hà Nội','Bắc Giang'=>'Bắc Giang',
			'Bắc Kạn'=>'Bắc Kạn','Bắc Ninh'=>'Bắc Ninh','Cao Bằng'=>'Cao Bằng',
			'Điện Biên'=>'Điện Biên','Hà Giang'=>'Hà Giang','Hà Nam'=>'Hà Nam',
			'Hà Tây'=>'Hà Tây','Hải Dương'=>'Hải Dương','TP Hải Phòng'=>'TP Hải Phòng',
			'Hòa Bình'=>'Hòa Bình','Hưng Yên'=>'Hưng Yên','Lai Châu'=>'Lai Châu',
			'Lào Cai'=>'Lào Cai','Lạng Sơn'=>'Lạng Sơn','Nam Định'=>'Nam Định','Thanh Hóa'=>'Thanh Hóa',
			'Ninh Bình'=>'Ninh Bình','Phú Thọ'=>'Phú Thọ','Quảng Ninh'=>'Quảng Ninh',
			'Sơn La'=>'Sơn La','Thái Bình'=>'Thái Bình','Thái Nguyên'=>'Thái Nguyên',
			'Tuyên Quang'=>'Tuyên Quang','Vĩnh Phúc'=>'Vĩnh Phúc','Yên Bái'=>'Yên Bái',
			'TP Đà Nẵng'=>'TP Đà Nẵng','Bình Định'=>'Bình Định','Phú Yên'=>'Phú Yên','Ninh Thuận'=>'Ninh Thuận',
			'Khánh Hòa'=>'Khánh Hòa','Đắk Lắk'=>'Đắk Lắk','Gia Lai'=>'Gia Lai','Bình Thuận'=>'Bình Thuận',
			'Đắk Nông'=>'Đắk Nông','Hà Tĩnh'=>'Hà Tĩnh','Kon Tum'=>'Kon Tum','Lâm Đồng'=>'Lâm Đồng',
			'Nghệ An'=>'Nghệ An','Quảng Bình'=>'Quảng Bình','Quảng Nam'=>'Quảng Nam',
			'Quảng Ngãi'=>'Quảng Ngãi','Quảng Trị'=>'Quảng Trị','Thừa Thiên Huế'=>'Thừa Thiên Huế',
			'TP. Hồ Chí Minh'=>'TP. Hồ Chí Minh','An Giang'=>'An Giang','Vũng Tàu'=>'Vũng Tàu',
			'Bạc Liêu'=>'Bạc Liêu','Bến Tre'=>'Bến Tre','Bình Dương'=>'Bình Dương','Bình Phước'=>'Bình Phước',
			'TP Cần Thơ'=>'TP Cần Thơ','Đồng Tháp'=>'Đồng Tháp','Hậu Giang'=>'Hậu Giang','Kiên Giang'=>'Kiên Giang',
			'Đồng Nai'=>'Đồng Nai','Cà Mau'=>'Cà Mau','Long An'=>'Long An','Tây Ninh'=>'Tây Ninh','Tiền Giang'=>'Tiền Giang',
			'Trà Vinh'=>'Trà Vinh','Vĩnh Long'=>'Vĩnh Long','Sóc Trăng'=>'Sóc Trăng'
		));
		$NoiSinh->setLabel('Nơi sinh');
		$this->add($NoiSinh);
		

		$DienThoaiNha = new Numeric('DienThoaiNha',array('placeholder'=>'057980123'));
		$DienThoaiNha->setLabel('Điện Thoại Nhà');
		$this->add($DienThoaiNha);
		$HomePage = new Text('HomePage');
		$HomePage->setLabel('HomePages');
		$this->add($HomePage);
		$YahooName = new Text('YahooName',array('placeholder'=>'fcduythien'));
		$YahooName->setLabel('Yahoo');
		$this->add($YahooName);
		$GmailName = new Text('GmailName',array('placeholder'=>''));
		$GmailName->setLabel('Gmail');
		$this->add($GmailName);
		$FacebookName = new Text('FacebookName',array('placeholder'=>''));
		$FacebookName->setLabel('Facebook');
		$this->add($FacebookName);
		$SkypeName = new Text('SkypeName',array('placeholder'=>'fcduythien'));
		$SkypeName->setLabel('Skype');
		$this->add($SkypeName);
		$DeTaiKhoaHoc = new Text('DeTaiKhoaHoc');
		$DeTaiKhoaHoc->setLabel('Đề Tài Khoa Học');
		$this->add($DeTaiKhoaHoc);
		$KhaNangDayThem = new Text('KhaNangDayThem');
		$KhaNangDayThem->setLabel('Khả Năng Dạy Thêm');
		$this->add($KhaNangDayThem);
		$CongViecHienTai = new Text('CongViecHienTai');
		$CongViecHienTai->setLabel('Công Việc Hiện Tại');
		$this->add($CongViecHienTai);
		$NganHang =new Text('NganHang',array('placeholder'=>'007123456'));
		$NganHang->setLabel('Ngân Hàng');
		$this->add($NganHang);
		$MaBangCap3= new Text('MaBangCap3');
		$MaBangCap3->setLabel('Mã Bằng Cấp 3');
		$this->add($MaBangCap3);
		$HoSoCap3 = new Text('HoSoCap3');
		$HoSoCap3->setLabel('Hồ Sơ Cấp 3');
		$this->add($HoSoCap3);
		$DiemThiDaiHoc = new Text('DiemThiDaiHoc');
		$DiemThiDaiHoc->setLabel('Điểm Thi Đại Học');
		$this->add($DiemThiDaiHoc);

		$TinhTrang =new  Select('TinhTrang',
					array(''=>'Tình trạng','Bình thường'=>'Bình thường',
					'Tốt nghiệp'=>'Tốt nghiệp','Bảo lưu'=>'Bảo lưu','Thôi học'=>'Thôi học',
					'Chuyển đi'=>'Chuyển đi','Chuyển đến'=>'Chuyển đến','Chuyển ngành'=>'Chuyển ngành',
					'Đình chỉ học tập'=>'Đình chỉ học tập',	
					),
					array('onChange'=>'this.form.submit()')
		);
		
		$TinhTrang->setLabel('Tình Trạng');
		$this->add($TinhTrang);
		$SoQuyetDinh = new Select('SoQuyetDinh',Quyetdinh::find(),array(
			'using' =>array('SoQuyetDinh','SoQuyetDinh'),
				'useEmpty' => true,
				'emptyText' => 'Số Quyết Định',
				'emptyValue' => ''

		));
		$SoQuyetDinh->setLabel('Số Quyết Định');
		$this->add($SoQuyetDinh);

		$MaSinhVienTruoc = new Text('MaSinhVienTruoc',array('placeholder' =>'vd.1159014001'));//<input type="text" value="" id="MaSV" name="MaSV">

		$MaSinhVienTruoc->setLabel('Mã Sinh Viên Trước');
		$this->add($MaSinhVienTruoc);

		$GhiChu = new Text('GhiChu');
		$GhiChu->setLabel('Ghi Chú');
		$this->add($GhiChu);
		$this->add(new Submit('filter', array(
			'class' => 'btn',
			
		)));
		$this->add(new Submit('unfilter', array(
			'class' => 'btn '
		)));
	}

	/**
	 * Prints messages for a specific element
	 */
	public function messages($name)
	{
		if ($this->hasMessagesFor($name)) {
			foreach ($this->getMessagesFor($name) as $message) {
				$this->flash->error($message);
			}
		}
	}

}

