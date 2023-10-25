 <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
	  <?php 
			$bulan_tes =array(
				'01'=>"Januari",
				'02'=>"Februari",
				'03'=>"Maret",
				'04'=>"April",
				'05'=>"Mei",
				'06'=>"Juni",
				'07'=>"Juli",
				'08'=>"Agustus",
				'09'=>"September",
				'10'=>"Oktober",
				'11'=>"November",
				'12'=>"Desember"
			);
		?>
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-12 main-chart">
						<h3>
							<!--<a  style="padding-left:2pc;" href="fungsi/hapus/hapus.php?laporan=jual" onclick="javascript:return confirm('Data Laporan akan di Hapus ?');">
								<button class="btn btn-danger">RESET</button>
							</a>-->
							<?php if(!empty($_GET['cari'])){ ?>
								Laporan Bonus Karyawan <?= $bulan_tes[$_POST['bln']];?> <?= $_POST['thn'];?>
							<?php }elseif(!empty($_GET['hari'])){?>
								Laporan Bonus Karyawan <?= $_POST['hari'];?>
							<?php }else{?>
								Laporan Bonus Karyawan <?= $bulan_tes[date('m')];?> <?= date('Y');?>
							<?php }?>
						</h3>
						<br/>
						<h4>Cari Laporan Per Bulan</h4>
						<form method="post" action="index.php?page=laporan&cari=ok">
							<table class="table table-striped">
								<tr>
									<th>
										Pilih Bulan
									</th>
									<th>
										Pilih Tahun
									</th>
									<th>
										Aksi
									</th>
								</tr>
								<tr>
								<td>
								<select name="bln" class="form-control">
									<option selected="selected">Bulan</option>
									<?php
										$bulan=array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember");
										$jlh_bln=count($bulan);
										$bln1 = array('01','02','03','04','05','06','07','08','09','10','11','12');
										$no=1;
										for($c=0; $c<$jlh_bln; $c+=1){
											echo"<option value='$bln1[$c]'> $bulan[$c] </option>";
										$no++;}
									?>
									</select>
								</td>
								<td>
								<?php
									$now=date('Y');
									echo "<select name='thn' class='form-control'>";
									echo '
									<option selected="selected">Tahun</option>';
									for ($a=2023;$a<=$now;$a++)
									{
										echo "<option value='$a'>$a</option>";
									}
									echo "</select>";
									?>
								</td>
								<td>
									<input type="hidden" name="periode" value="ya">
									<button class="btn btn-primary">
										<i class="fa fa-search"></i> Cari
									</button>
									<a href="index.php?page=laporan" class="btn btn-success">
										<i class="fa fa-refresh"></i> Refresh</a>
										
									<?php if(!empty($_GET['cari'])){?>
										<a href="excel.php?cari=yes&bln=<?=$_POST['bln'];?>&thn=<?=$_POST['thn'];?>" class="btn btn-info"><i class="fa fa-download"></i>
										Excel</a>
									<?php }else{?>
										<a href="excel.php" class="btn btn-info"><i class="fa fa-download"></i>
										Excel</a>
									<?php }?>
								</td>
								</tr>
							</table>
						</form>
						<form method="post" action="index.php?page=laporan&hari=cek">
							<table class="table table-striped">
								<tr>
									<th>
										Pilih Tanggal
									</th>
									<th>
										Aksi
									</th>
								</tr>
								<tr>
								<td>
									<input type="date" value="<?= date('Y-m-d');?>" class="form-control" name="hari">
								</td>
								<td>
									<input type="hidden" name="periode" value="ya">
									<button class="btn btn-primary">
										<i class="fa fa-search"></i> Cari
									</button>
									<a href="index.php?page=laporan" class="btn btn-success">
										<i class="fa fa-refresh"></i> Refresh</a>
										
									<?php if(!empty($_GET['hari'])){?>
										<a href="excel.php?hari=cek&tgl=<?= $_POST['hari'];?>" class="btn btn-info"><i class="fa fa-download"></i>
										Excel</a>
									<?php }else{?>
										<a href="excel.php" class="btn btn-info"><i class="fa fa-download"></i>
										Excel</a>
									<?php }?>
								</td>
								</tr>
							</table>
						</form>
						<div class="clearfix" style="border-top:1px solid #ccc;"></div>
						<br/> 
						<br/>
						<!-- view barang -->	
						<div class="modal-view">
							<table class="table table-bordered" id="example1">
								<thead>
									<tr style="background:#DFF0D8;color:#333;">
										<th> No</th>
										<th> Nama Pelanggan</th>
										<th> Jenis Orderan</th>
										<th> Karyawan Produksi</th>
										<th style="width:10%;"> Jumlah Orderan</th>
										<th style="width:10%;"> Total (Rp)</th>
										<th> Admin</th>
										<th> Tanggal Input</th>
									</tr>
								</thead>
								<tbody id="badan">
									<?php 
										$no=1; 
										if(!empty($_GET['cari'])){
											$periode = $_POST['bln'].'-'.$_POST['thn'];
											$no=1; 
											$jumlah = 0;
											$bayar = 0;
											$hasil = $lihat -> periode_jual($periode);
										}elseif(!empty($_GET['hari'])){
											$hari = $_POST['hari'];
											$no=1; 
											$jumlah = 0;
											$bayar = 0;
											$hasil = $lihat -> hari_jual($hari);
										}else{
											$hasil = $lihat -> jual();
										}
									?>
									<?php 
										$bayar = 0;
										$jumlah = 0;
										$id = 1;
										foreach($hasil as $isi){ 
											$bayar += $isi['total'];
											
											$jumlah += $isi['jumlah'];
											$idJumlah = "jumlah".$id;
											$total = $isi['total']; 	
											$idTotal = "total".$id;
											$id++;
									?>
									<tr>
										<td id="cellNo"><?php echo $no;?></td>
										<td><?php echo $isi['nama_barang'];?></td>
										<td><?php echo $isi['nama_kategori'];?></td>
										<td><?php echo $isi['satuan_barang'];?></td>
										<td id="<?php echo $idJumlah;?>"><?php echo $isi['jumlah'];?> </td>
										<td id="<?php echo $idTotal;?>"><?php echo $isi['total'];?></td>
										<td><?php echo $isi['nm_member'];?></td>
										<td><?php echo $isi['tanggal_input'];?></td>
									</tr>
									<?php $no++; }?>
								</tbody>
								<tfoot>
									<tr>
										<th colspan="4">Total Produksi</td>
										<th onclick="updateJumlah();" id="cellJumlah"><?php echo $jumlah;?></td>
										<th onclick="updateJumlah();" id="cellTotal">IDR <?php echo number_format($bayar);?>.00</th>
										<th style="background:#0bb365;color:#fff;"></th>
										<th style="background:#0bb365;color:#fff;"></th>
									</tr>
								</tfoot>
							</table>
						</div>
						<div class="clearfix" style="padding-top:5pc;"></div>
					</div>
				  </div>
              </div>
          </section>
      </section>
	  <script>
		function updateJumlah(){
			let numb = document.getElementById("badan");		
			var cellNo = numb.children;
			var tr = cellNo[0].childNodes;
			var nilai = tr[1].innerHTML; 
			var idJumlah = "jumlah"+nilai;
			var cellJumlah = document.getElementById(idJumlah);	
			var jumlah = cellJumlah.innerHTML; 
			var total = 0;
			var loop = parseInt(document.getElementById("badan").childElementCount);
			for (let i = 0; i < loop; i++) {
				tr = cellNo[i].childNodes;
				nilai = tr[1].innerHTML;
				idJumlah = "jumlah"+nilai;
				cellJumlah = document.getElementById(idJumlah);	
				jumlah = cellJumlah.innerHTML;
				total = total+parseFloat(jumlah); 
			}
			document.getElementById("cellJumlah").innerHTML = total;
			
			var idTotal = "total"+nilai;
			var cellTotal = document.getElementById(idTotal);	
			var total = cellTotal.innerHTML;
			var ttl = 0;
			var loop = parseInt(document.getElementById("badan").childElementCount);
			for (let i = 0; i < loop; i++) {
				tr = cellNo[i].childNodes;
				nilai = tr[1].innerHTML;
				idTotal = "total"+nilai;
				cellTotal = document.getElementById(idTotal);	
				total = cellTotal.innerHTML;
				ttl = ttl+parseFloat(total); 
			}
			document.getElementById("cellTotal").innerHTML = formatter.format(ttl); 
		}
		const formatter = new Intl.NumberFormat('en-US', {
			style: 'currency',
			currency: 'IDR',

			// These options are needed to round to whole numbers if that's what you want.
			//minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
			//maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
		});
	  </script>
	

